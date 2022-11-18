//
//  FavoriteViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit

var favorites: [Favorite] = [Favorite]()


class FavoriteViewController: UIViewController {
    
    let tableView: UITableView = {
            let tableView = UITableView()
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
            return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
                view.backgroundColor = .systemBackground
                view.addSubview(tableView)
                self.navigationItem.titleView = twoLineTitleView(text: "Favorite Animals")
                navigationController?.navigationBar.tintColor = UIColor.label
                navigationController?.navigationBar.barTintColor = UIColor.white
                let appearance = UINavigationBarAppearance()
                appearance.shadowColor = nil
                navigationController?.navigationBar.standardAppearance = appearance
                tableView.delegate = self
                tableView.dataSource = self
                fetchLocalStorageForDownload()
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("Add to favorites"), object: nil, queue: nil) { _ in
                    self.fetchLocalStorageForDownload()
                }
                NotificationCenter.default.addObserver(self, selector: #selector(self.removeFavorite(notification:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

    }
    private func fetchLocalStorageForDownload() {
            DataPersistanceManager.shared.fetchingFavoriteFromDataBase { [weak self] result in
                switch result {
                case .success(let favorit):
                    favorites = favorit
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
    
    @objc func removeFavorite(notification: NSNotification) {
         if let name = notification.userInfo?["name"] as? String {
             var index = 0
             for fav in favorites {
                 if name == fav.name {
                     deleteFavorite(model: fav)
                     favorites.remove(at: index)
                 }
                 index += 1
             }
         }
        }
       
       override func viewWillAppear(_ animated: Bool) {
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
       }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as? FavoritesTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: favorites[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = favorites[indexPath.row].name
        var index = 0
        for shape in shapes {
            if name == shape.name {
                let vc = ShapesInfoViewController()
                vc.index = index
                vc.isFavorite = true
                navigationController?.pushViewController(vc, animated: true)
            }
            index += 1
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           switch editingStyle {
           case .delete:
               deleteFavorite(model: favorites[indexPath.row])
               favorites.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
           default:
               break
           }
       }

   }

   extension FavoriteViewController {
       func deleteFavorite(model: Favorite) {
           DataPersistanceManager.shared.deleteFavoriteWidth(model: model) { result in
               switch result {
               case .success():
                   print("Deleted from the database")
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
   }
