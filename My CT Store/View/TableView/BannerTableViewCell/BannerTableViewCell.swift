//
//  BannerTableViewCell.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 29/03/23.
//

import UIKit
import SDWebImage

protocol BannerTableViewCellDelegat: AnyObject {
    func didSelectBanner(at index: Int)
}

class BannerTableViewCell: UITableViewCell {
    
//MARK: - IBOUTLETS AND VARIABLES
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    var arrBanner: [BannerViewModel] = []
    weak var delegate: BannerTableViewCellDelegat?
    override func awakeFromNib(){
        super.awakeFromNib()
        bannerCollectionView.register(UINib(nibName: BannerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
    }
    
//MARK: - FUNCTION
    func set(arrBanner: [BannerViewModel]) {
        self.arrBanner = arrBanner
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.reloadData()
    }
}

//MARK: - COLLECTIONVIEW DELEGATE AND DATASOURCE METHODES
extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
        let banner: BannerViewModel = arrBanner[indexPath.row]
        cell.bannerImageView.sd_setImage(with: URL(string: banner.getImage()), placeholderImage: UIImage(systemName: "hourglass.start"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectBanner(at: indexPath.row)
    }
}

//MARK: - COLLECTIONVIEW FLOWLAYOUT METHODE
extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6.0, left: 8.0, bottom: 4.0, right: 12.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}
