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
    add()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func add() {
    DispatchQueue.main.async {
      self.array.append(Cell())
      self.collectionView.reloadData()
      self.collectionView.scrollToItem(at: IndexPath(row: self.array.count-1, section: 0), at: .right, animated: true)
    }
  }
  
  func remove(at index: Int) {
    DispatchQueue.main.async {
      self.array.remove(at: index)
      self.collectionView.deleteItems(at: [IndexPath(row: index, section: 0)])
    }
    
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    remove(at: indexPath.row)
  }
  
}

