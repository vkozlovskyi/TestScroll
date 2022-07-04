//
//  ViewController.swift
//  TestScroll
//
//  Created by Vladimir Kozlovskyi on 04.07.2022.
//

import UIKit

struct Cell {
  
}

class ViewController: UIViewController {
  
  var array: [Cell] = []

  @IBOutlet weak var collectionView: UICollectionView!
  
  
  @IBAction func didPress(_ sender: Any) {
    array.append(Cell())
    collectionView.reloadData()
    collectionView.scrollToItem(at: IndexPath(row: array.count-1, section: 0), at: .right, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCell", for: indexPath)
    cell.backgroundColor = .gray
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    array.count
  }
  
  
}
