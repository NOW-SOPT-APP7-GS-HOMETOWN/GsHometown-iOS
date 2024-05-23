//
//  DetailViewController.swift
//  GsHometown-iOS
//
//  Created by 오연서 on 5/17/24.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class DetailViewController: UIViewController {
    
    private var isTouched = false {
        didSet {
            if isTouched {
                heartButton.setImage(GSImage.iconLoveFill, for: .normal)
            } else {
                heartButton.setImage(GSImage.iconLove, for: .normal)
            }
        }
    }

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainImage = UIImageView().then {
        $0.image = GSImage.mockDetailMain
        $0.contentMode = .scaleAspectFit
    }
    private let infoStackView = UIStackView().then{
        $0.axis = .vertical
    }
    private let mainLabel = UILabel().then{
        $0.text = "핫매콤야끼우동"
        $0.font = GSFont.h3
        $0.textColor = GSColor.grey10
    }
    private let priceLabel = UILabel().then{
        $0.text = "3,900원"
        $0.font = GSFont.h4
        $0.textColor = GSColor.grey10
    }
    private let buttonStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 15
    }
    private lazy var heartButton = UIButton().then{
        $0.setImage(GSImage.iconLove, for: .normal)
        $0.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    private lazy var shareButton = UIButton().then{
        $0.setImage(GSImage.iconShare, for: .normal)
    }
    private let receiptInfoLabel = UILabel().then{
        $0.text = "수령 정보"
        $0.textColor = GSColor.grey08
        $0.font = GSFont.b4m
    }
    private let receiptStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 9
    }
    private let receiptAbleLabel = UILabel().then{
        $0.text = "수령 가능"
        $0.font = GSFont.b4m
        $0.textColor = GSColor.grey10
    }
    private let receiptDivideView = UIView().then{
        $0.backgroundColor = GSColor.grey04
    }
    private let zonePickUpImage = UIImageView().then{
        $0.image = GSImage.zonePickUpLarge
    }
    private let reviewStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 8
    }
    private let starImage = UIImageView().then {
        $0.image = GSImage.iconFiveStar!
    }
    private let starLabel = UILabel().then{
        $0.text = "5.0"
        $0.font = GSFont.b4s
        $0.textColor = GSColor.grey10
    }
    private let reviewNumberLabel = UILabel().then{
        $0.text = "(2)"
        $0.font = GSFont.b4m
        $0.textColor = GSColor.grey10
    }
    private lazy var reviewButton = UIButton().then{
        $0.setTitle("후기보기", for: .normal)
        $0.setTitleColor(GSColor.grey10, for: .normal)
        $0.titleLabel?.font = GSFont.b4m
        $0.setImage(GSImage.arrowRight, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    private let divider = UIView.grayDivider(height: 7)
    private let segmentControlView = CustomSegmentControl(items: ["상품정보", "이용안내", "유의사항"]).then{
        $0.layer.cornerRadius = 24
        $0.backgroundColor = GSColor.grey05
    }
    private let detailImage = UIImageView().then {
        $0.image = GSImage.mockDetailInfo
        $0.contentMode = .scaleAspectFit
    }
    private let tabBar = DetailTabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setAutolayout()
        setNavigation()
        getDetailData()
    }
    
    @objc func heartButtonTapped() {
        isTouched.toggle()
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        self.view.addSubview(tabBar)
        scrollView.addSubview(contentView)
        [mainImage, infoStackView, buttonStackView, receiptInfoLabel, receiptStackView,
         reviewStackView, divider, segmentControlView, detailImage].forEach {
            contentView.addSubview($0)
        }
        [mainLabel, priceLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        [heartButton, shareButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [receiptAbleLabel, receiptDivideView, zonePickUpImage].forEach {
            receiptStackView.addArrangedSubview($0)
        }
        [starImage, starLabel, reviewNumberLabel, reviewButton].forEach {
            reviewStackView.addArrangedSubview($0)
        }
    }
    
    private func setAutolayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints{
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(3500)
        }
        mainImage.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(375)
        }
        infoStackView.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(53)
            $0.width.equalTo(280)
        }
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(6)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(44)
        }
        receiptInfoLabel.snp.makeConstraints{
            $0.top.equalTo(infoStackView.snp.bottom).offset(14)
            $0.leading.equalTo(infoStackView)
        }
        receiptStackView.snp.makeConstraints{
            $0.centerY.equalTo(receiptInfoLabel)
            $0.leading.equalTo(receiptInfoLabel.snp.trailing).offset(20)
            $0.height.equalTo(20)
            $0.width.equalTo(120)
        }
        receiptDivideView.snp.makeConstraints{
            $0.width.equalTo(1)
        }
        reviewStackView.snp.makeConstraints{
            $0.top.equalTo(receiptStackView.snp.bottom).offset(14)
            $0.leading.equalTo(infoStackView)
            $0.height.equalTo(20)
            $0.width.equalTo(240)
        }
        divider.snp.makeConstraints{
            $0.top.equalTo(reviewStackView.snp.bottom).offset(17)
            $0.horizontalEdges.equalToSuperview()
        }
        segmentControlView.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(45)
        }
        detailImage.snp.makeConstraints{
            $0.top.equalTo(segmentControlView.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2600)
        }
        tabBar.snp.makeConstraints{
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(94)
        }
    }
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getDetailData() {
        let apiProvider = APIProvider<APITarget.Products>()
        apiProvider.request(DTO.GetDetailProductResponse.self,
                                target: .getDetailProduct(DTO.GetDetailProductRequest(memberId: 1, productId: 3))) { [weak self] response in
                    guard let self = self else { return }
            switch response {
            case .success(let response):
                self.updateUI(with: response.data)
            default:
                response.statusDescription()
            }
        }
    }
    
    private func updateUI(with response: DTO.GetDetailProductResponse.ProductDetail) {
        let thumbnailURL = URL(string: response.thumbnail)
        let detailURL = URL(string: response.detailImage)
        self.mainImage.kf.setImage(with: thumbnailURL)
        self.mainLabel.text = response.title
        self.isTouched = response.isLiked
        self.priceLabel.text = "\(response.price)원"
        self.receiptAbleLabel.text = response.isReceiveAvailable ? "수령 가능" : "수령 불가"
        self.reviewNumberLabel.text = "(\(response.reviewCount))"
        self.detailImage.kf.setImage(with: detailURL)
    }
}
