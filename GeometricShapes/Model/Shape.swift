//
//  Shape.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

struct Shapes {
    let name: String
    let image: UIImage
    let info: String
    let pronounce: String
    let quiz: String
    
}

let shapes: [Shapes] = [

    Shapes(name: "Cube", image: UIImage(named: "Cube")!, info: "A cube is a three-dimensional shape which has 6 faces, 8 vertices and 12 edges. The faces of the cube are square.",pronounce: "/kyo͞ob/", quiz: "What shape is Rubik famous for?"),
                         
    Shapes(name: "Cuboid", image: UIImage(named: "Cuboid")!, info: "A cuboid is also three dimensional solid having 6 faces, 8 vertices and 12 edges but the faces of the cuboid are in a rectangular shape.", pronounce: "/ˈkyo͞oboid/", quiz: "What is the shape of the match box?"),
    
    Shapes(name: "Cone", image: UIImage(named: "Cone")!, info: "A cone is a solid which has a circular base and narrows smoothly from the surface to the top at a point called apex or vertex.", pronounce: "/kōn/", quiz: "What shape is an ice cream cone an example of?"),
    
    Shapes(name: "Cylinder", image: UIImage(named: "Cylinder")!, info: "    A cylinder is a 3d solid shape that has two parallel circular bases connected by a curved surface. It has no vertex.", pronounce: "/ˈsɪl.ɪn.dər//", quiz: "What shape is formed by connecting two parallel circles?"),
    
    Shapes(name: "Sphere", image: UIImage(named: "Sphere")!, info: "   A sphere is a round shape in a 3d plane, whose radius is extended to three dimensions (x-axis, y-axis and z-axis).", pronounce: "/sfɪər/", quiz: "What shape is a soccer ball?"),
    
    Shapes(name: "Frustum", image: UIImage(named: "Frustum")!, info: "It is a cone-shaped structure, but instead of an apex, a circle is present at one end.", pronounce: "/ˈfrʌs.təm", quiz: "Which is cone-shaped structure?"),
    
    Shapes(name: "Hexagon", image: UIImage(named: "Hexagon")!, info: "It consists of six equal sides, and sum of the angles is equal to 720 degrees. Six lines of symmetry are present.", pronounce: "ˈhek.sə.ɡən/", quiz: "Angels of which shape is eqaul to 720 degress?"),
    
    Shapes(name: "Hexagonal-prism", image: UIImage(named: "Hexagonal-prism")!, info: "Consisting of twelve vertices, eighteen edges, and eight faces, this figure has two hexagons at the opposite ends. The remaining faces have a rectangular or square shape.", pronounce: "/hekˈsæɡ.ən.əl/ /ˈprɪz.əm/", quiz: "Which figure has two hexagons at the opposite ends?"),
    
    Shapes(name: "Trapezium", image: UIImage(named: "Trapezium")!, info: "All four sides are unequal and non-parallel, and the line of symmetry is absent. It is called a Trapezoid in the UK.", pronounce: "/trəˈpiː.zi.əm/", quiz: "At which shapes the line of symmetry is absent?"),
    
    Shapes(name: "Octahedron", image: UIImage(named: "Octahedron")!, info: "This figure has eight triangles arranged in a specific manner to form six vertices, eight faces, and twelve edges. The triangles may be either equilateral or isosceles.", pronounce: "/ˌɒk.təˈhiː.drən/", quiz: "A solid shape whose eight sides are triangles of equal size?"),
    
    Shapes(name: "Parallelogram", image: UIImage(named: "Parallelogram")!, info: "They consist of two sets of opposite lines that are equal and parallel. The opposite angles are also equal regarding any value. Line of symmetry may be present.", pronounce: " /ˌpær.əˈlel.ə.ɡræm/", quiz: "At which shapes he two sets of opposite sides are parallel and of equal length to each other?"),
    
    Shapes(name: "Pentagon", image: UIImage(named: "Pentagon")!, info: "It consists of five equal sides, and the sum of the angles is equal to 540 degrees. Five lines of symmetry are present.", pronounce: "/ˈpen.tə.ɡən/", quiz: "A shape with five sides and five angles?"),
    
    Shapes(name: "Rhombus", image: UIImage(named: "Rhombus")!, info: "All four sides are equal and parallel, but only opposite angles are equal. Two lines of symmetry are present. It is closely related to the square and parallelogram.", pronounce: "/ˈrɒm.bəs/", quiz: "A flat shape that has four sides that are all of equal length?")
    
    

]
