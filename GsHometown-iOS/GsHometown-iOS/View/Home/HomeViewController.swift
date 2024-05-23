//
//  HomeViewController.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import Moya
import SnapKit
import Kingfisher

class HomeViewController: UIViewController {

    private var collectionView: UICollectionView? = nil
    private var eventCurrentImage: UIImage = GSImage.mockEvent1!
    private let gsNavigationBar = GSNavigationBar()
    var advertisementSmallData: [String] = []
    var advertisementLargeData: [String] = []
    var eventData: [EventOfTheMonth] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeCollectionView()
        setStyle()
        setUI()
        setAutolayout()
        addObservers()
        getHomeData()
    }

    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = GSColor.grey02
    }

    private func setUI() {
        self.view.addSubview(gsNavigationBar)
    }

    private func setAutolayout() {
        gsNavigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        collectionView!.snp.makeConstraints {
            $0.top.equalTo(gsNavigationBar.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }

    private func makeCollectionView() {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal

        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return HomeSectionType(rawValue: sectionIndex)?.createSection()
        }
        layout.register(
            EventReusableView.self,
            forDecorationViewOfKind: EventReusableView.identifier
        )
        layout.register(
            ServiceReusableView.self,
            forDecorationViewOfKind: ServiceReusableView.identifier
        )
        self.collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        self.collectionView!.backgroundColor = GSColor.grey02
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        registerCells()
        self.view.addSubview(collectionView!)
    }

    private func registerCells() {
        self.collectionView!.register(
            PageCell.self,
            forCellWithReuseIdentifier: PageCell.cellIdentifier
        )
        self.collectionView!.register(
            OrderServiceCell.self,
            forCellWithReuseIdentifier: OrderServiceCell.cellIdentifier
        )
        self.collectionView!.register(
            ConvenienceCell.self,
            forCellWithReuseIdentifier: ConvenienceCell.cellIdentifier
        )
        self.collectionView!.register(
            ServiceCell.self,
            forCellWithReuseIdentifier: ServiceCell.cellIdentifier
        )
        self.collectionView!.register(
            EventCell.self,
            forCellWithReuseIdentifier: EventCell.cellIdentifier
        )
        self.collectionView!.register(
            EventOfTheWeekCell.self,
            forCellWithReuseIdentifier: EventOfTheWeekCell.cellIdentifier
        )
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(currentEventImageChanged),
            name: .currentEventID,
            object: nil
        )
    }

    @objc
    func currentEventImageChanged(notification: Notification) {
        if let id = notification.userInfo?["currentEventID"] as? Int {
            switch id {
            case 1:
                self.eventCurrentImage = GSImage.mockEvent1!
            case 2:
                self.eventCurrentImage = GSImage.mockEvent2!
            case 3:
                self.eventCurrentImage = GSImage.mockEvent3!
            default:
                self.eventCurrentImage = GSImage.mockEvent1!
            }
            collectionView!.reloadData()
        }
    }
    
    func getHomeData() {
        let apiProvider = APIProvider<APITarget.All>()
        apiProvider.request(DTO.GetHomeResponse.self, target: .getHome) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                self.advertisementSmallData = response.data.topBanners
                self.advertisementLargeData = response.data.bottomBanners
                var eventData: [EventOfTheMonth] = []
                for i in 0..<response.data.monthlyEvents.mainBanners.count {
                    eventData.append(EventOfTheMonth(id: i, item: response.data.monthlyEvents.mainBanners[i]))
                }
                self.eventData = eventData
                self.collectionView!.reloadData()
            default:
                response.statusDescription()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard let section = HomeSectionType(rawValue: section) else { return 0 }
        switch section {
        case .advertisementSmall:
            return advertisementSmallData.count
        case .orderServices:
            return 2
        case .convenienceServices:
            return 4
        case .services:
            return ServiceType.allCases.count
        case .event:
            return eventData.count
        case .eventOfTheWeek:
            return 1
        case .advertisementLarge:
            return advertisementSmallData.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        switch section {
        case .advertisementSmall:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PageCell.cellIdentifier,
                for: indexPath
            ) as? PageCell else {
                return UICollectionViewCell()
            }
            let image = URL(string: advertisementSmallData[indexPath.row])
            cell.posterImageView.kf.setImage(with: image)
            return cell
        case .orderServices:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OrderServiceCell.cellIdentifier,
                for: indexPath
            ) as? OrderServiceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: indexPath.row == 0 ? .gs25 : .gsTheFresh)
            return cell
        case .convenienceServices:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ConvenienceCell.cellIdentifier,
                for: indexPath
            ) as? ConvenienceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: ConvenienceType(rawValue: indexPath.row)!)
            return cell
        case .services:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ServiceCell.cellIdentifier,
                for: indexPath
            ) as? ServiceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: ServiceType(rawValue: indexPath.row)!)
            return cell
        case .event:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EventCell.cellIdentifier,
                for: indexPath
            ) as? EventCell else {
                return UICollectionViewCell()
            }
            cell.bindData(image: eventCurrentImage)
            return cell
        case .eventOfTheWeek:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EventOfTheWeekCell.cellIdentifier,
                for: indexPath
            ) as? EventOfTheWeekCell else {
                return UICollectionViewCell()
            }
            return cell
        case .advertisementLarge:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PageCell.cellIdentifier,
                for: indexPath
            ) as? PageCell else {
                return UICollectionViewCell()
            }
            let image = URL(string: advertisementLargeData[indexPath.row])
            cell.posterImageView.kf.setImage(with: image)
            return cell
        }
    }
}
