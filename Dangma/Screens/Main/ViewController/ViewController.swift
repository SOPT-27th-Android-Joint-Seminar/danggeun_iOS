//
//  ViewController.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var announcementView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeData = [Item]()
    
    let layout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        fetchCollectionView()
        
    }
    
    
    // 공지사항 x 버튼 눌렀을 때
    @IBAction func closeClicked(_ sender: Any) {
        // 공지사항 뷰 없애기
        announcementView.removeFromSuperview()
        // collectionView의 top을 우리동네 뷰의 bottom에 맞춘다.
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topView.bottomAnchor).isActive = true
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        // index 값을 다음 뷰로 넘겨준다.
        vc.index = homeData[indexPath.row].idx
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.nameLabel.text = homeData[indexPath.row].productName
        let time: String = (homeData[indexPath.row].createdAt)
        
        cell.whereLabel.text = (homeData[indexPath.row].local ?? "") + " · " + time.timeAgoSince(time.getDateFormat(time: time)!)
        cell.moneyLabel.text = DecimalWon(value: homeData[indexPath.row].price)
        cell.heartLabel.text = "\(String(describing: homeData[indexPath.row].likeNum))"
        cell.commentsLabel.text = "\(String(describing: homeData[indexPath.row].commentNum))"
        
        // url 이미지 불러오기 - 비동기
        let url = URL(string: homeData[indexPath.row].imgLink)
        var image: UIImage?
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url!) else {
                return
            }
            DispatchQueue.main.async {
                image = UIImage(data: data)
                cell.itemImage.image = image
            }
        }
        return cell
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout { }

// MARK: Server Connect

extension ViewController {
    func loadData() {
        HomeService.shared.load() { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let loadData = data as? [Item] {
                    print("success")
                    //print(homeData)
                    self.homeData = loadData
                    self.collectionView.reloadData()
                    
                }
            case .requestErr( _):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
}

// MARK: Layout

extension ViewController {
    func fetchCollectionView() {
        
        layout.scrollDirection = .vertical
        // cell 왼쪽 - 셀 사이 - cell 오른쪽 간격이 모두 같게 조절 (cell 하나가 162로 고정되어있음)
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: (view.frame.width - 324)/3,
                                           bottom: 0,
                                           right: (view.frame.width - 324)/3)
        layout.itemSize = CGSize(width: 162,
                                 height: 260)
        
        collectionView.register(HomeCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
    }
}



func DecimalWon(value: Int) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
    
    return result
}


