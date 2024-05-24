//
//  PreOrderViewController.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

protocol PreOrderCoordinatorDelegate: AnyObject {
    func goToDetailView()
}

class PreOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        getPreOrderData()
    }

    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    private lazy var contentView = UIView()
    //    let delegate: PreOrderCoordinatorDelegate
    let mainView = MainView()
    let eventView = EventView()
    let specialProductView = SpecialProductView()
    let allProductView: AllProductView

    init(delegate: PreOrderCoordinatorDelegate) {
        self.allProductView = AllProductView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                             delegate: delegate)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = GSColor.grey00
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)
        contentView.isUserInteractionEnabled = true

        mainView.isUserInteractionEnabled = true
        eventView.isUserInteractionEnabled = true

        contentView.addSubview(mainView)
        contentView.addSubview(eventView)
        contentView.addSubview(specialProductView)
        contentView.addSubview(allProductView)

    }

    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView) // 이거 있어야 subview 클릭 가능
            $0.height.equalTo(2951)
        }

        mainView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(651)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        eventView.snp.makeConstraints{
            $0.top.equalTo(mainView.snp.bottom)
            $0.height.equalTo(358)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        specialProductView.snp.makeConstraints{
            $0.top.equalTo(eventView.snp.bottom)
            $0.height.equalTo(302)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        allProductView.snp.makeConstraints{
            $0.top.equalTo(specialProductView.snp.bottom)
            $0.height.equalTo(1500.5)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func getPreOrderData() {
        let apiProvider = APIProvider<APITarget.Products>()
        apiProvider.request(DTO.GetPreorderInfoResponse.self,
                            target: .getPreorderInfo(DTO.GetPreorderInfoRequest(type: "gspay"))) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let response):
                let preorderInfo = response.data
                
                let topBanners = preorderInfo.topBanners
                let headerTitle = preorderInfo.headerTitle
                let date = preorderInfo.date
                let products = preorderInfo.products
                
                self.mainView.bannerView.preOrderAd = []
                for topBanner in topBanners {
                    self.mainView.bannerView.preOrderAd.append(topBanner)
                }
                for product in products {
                    decodeProductData(product: product)
                }
                doubleProductData()
                self.eventView.discountEventHeaderView.configure(with: headerTitle, date: date)
                self.mainView.bannerView.collectionView?.reloadData()
                print(self.mainView.bannerView.preOrderAd)
                self.eventView.discountEventCollectionView.reloadData()
            default:
                response.statusDescription()
            }
        }
    }
    
    private func decodeProductData(product : DTO.GetPreorderInfoResponse.PreorderInfo.Products) {
        let discountEvent = DiscountEvent(image: product.image, title: product.title, cardPrice: product.cardPrice, price: product.price, originalPrice: product.originalPrice)
        self.eventView.discountEventCollectionViewDataSource.discountEventData.append(discountEvent)
    }
    
    private func doubleProductData() {
        self.eventView.discountEventCollectionViewDataSource.discountEventData = self.eventView.discountEventCollectionViewDataSource.discountEventData + self.eventView.discountEventCollectionViewDataSource.discountEventData
    } // 서버에서 내려주는 이미지 개수 부족으로 collectionView 스크롤 불가
}

