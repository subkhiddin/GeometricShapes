//
//  ExploreShapesViewController.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 15/11/22.
//

import UIKit

class ExploreShapesViewController: UIViewController {
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        self.navigationItem.titleView = twoLineTitleView(text: "Explore Shapes")
        navigationController?.navigationBar.tintColor = UIColor.label
        navigationController?.navigationBar.barTintColor = UIColor.white
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = appearance
        configureCollectionView()
    }
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CreateFlowLayout.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func transform(cell: UICollectionViewCell) {
        let coverFrame = cell.convert(cell.bounds, to: self.view)
        
        let transformOffsetY = collectionView.bounds.height * 2 / 3
        let percent = getPercent(value: (coverFrame.minY - transformOffsetY) / (collectionView.bounds.height - transformOffsetY))
        
        let maxScaleDifference: CGFloat = 0.2
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1 - scale, y: 1 - scale)
        cell.alpha = 1 - percent
    }
    
    func getPercent(value: CGFloat) -> CGFloat {
        let lBound: CGFloat = 0
        let UBound: CGFloat = 1
        
        if value < lBound {
            return lBound
        } else if value > UBound {
            return UBound
        }
        return value
    }
}

extension ExploreShapesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(shapes.count)
        return shapes.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async {
            cell.setAnimalImage(image: shapes[indexPath.row].image, name: shapes[indexPath.row].name)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.visibleCells.forEach { transform(cell: $0) }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ShapesInfoViewController()
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
    


