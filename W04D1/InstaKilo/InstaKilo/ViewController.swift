////  ViewController.swift
// Created: 2019-06-25
//


import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
}

class SectionTitleCell: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
}
class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var segments: UISegmentedControl!
    var sections = [String]()
    var images = [String:[UIImage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.url(forResource: "images", withExtension:"") {
            let directoryContents = try? FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
            let imageFolders = directoryContents?.filter{ $0.hasDirectoryPath } //.map{$0.lastPathComponent}
            for folder in imageFolders ?? [] {
                sections.append(folder.lastPathComponent)
                let directoryContents = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil, options: [])
                let imageFiles = directoryContents?.filter { $0.pathExtension == "jpg"}.map{UIImage(contentsOfFile: $0.path)}
                if let imageFiles = imageFiles as? [UIImage] {
                    images[folder.lastPathComponent] = imageFiles
                }
            }
            for i in 0..<sections.count {
                segments.setTitle(sections[i], forSegmentAt: i)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width:CGFloat = 0
        if indexPath.row % 3 == 0 {
            width = view.frame.width/2 - 6
        } else {
            width = view.frame.width/4
        }
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionTitle", for: indexPath) as! SectionTitleCell
        cell.titleLabel.text = sections[indexPath.section]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images[sections[section]]?.count ?? 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "imagePlaceHolder", for: indexPath) as! ImageCell
        cell.imageView.image = images[sections[indexPath.section]]?[indexPath.row]
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailViewController = segue.destination as? DetailViewController {
                if let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell) {
                    detailViewController.image = images[sections[indexPath.section]]?[indexPath.row]
                }
            }
        }
    }
    @IBAction func touchedInSegment(_ sender: UISegmentedControl) {
//        UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:sender.selectedSegmentIndex]];
//
//        [self.collectionView setContentOffset:CGPointMake(0, attributes.frame.origin.y - self.collectionView.contentInset.top - self.collectionView.safeAreaInsets.top) animated: true];
        let layoutAttributes = collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionHeader, at:IndexPath(item: 0, section: sender.selectedSegmentIndex))!
        
        collectionView.setContentOffset( CGPoint(x: 0,y: (layoutAttributes.frame.origin.y) - collectionView.contentInset.top - collectionView.safeAreaInsets.top), animated: true)
    }
}

