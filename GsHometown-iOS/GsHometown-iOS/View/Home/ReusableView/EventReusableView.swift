//
//  EventReusableView.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/16/24.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class EventReusableView: UICollectionReusableView {

    private let titleLabel: UILabel = UILabel()
    private let subTitleLabel: UILabel = UILabel()
    private let currentEventFrame: UIImageView = UIImageView()
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 28
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        return collectionView
    }()

    static let identifier = "EventReusableView"
    var initData: [EventOfTheMonth] = []
    var items: [EventOfTheMonth] = []
    var totalItemCount = 0
    private var autoScrollTimer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        getHomeData()
        addObservers()
        setStyle()
        setUI()
        setAutoLayout()
        setDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    private func setStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        collectionView.do {
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.register(
                EventCell.self,
                forCellWithReuseIdentifier: EventCell.cellIdentifier
            )
            $0.decelerationRate = .fast
            $0.reloadData()
        }
        titleLabel.do {
            $0.font = GSFont.h4
            $0.textColor = GSColor.grey10
            $0.text = "GS25 이달의 행사"
        }
        subTitleLabel.do {
            $0.font = GSFont.b3m
            $0.textColor = GSColor.grey08
            $0.text = "두근두근 기대되는 이달의 편의점 행사는?"
        }
        currentEventFrame.do {
            $0.image = GSImage.currentEventFrame!
        }
    }

    private func setUI() {
        addSubview(collectionView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(currentEventFrame)
    }

    private func setAutoLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(71)
            $0.width.equalTo(78)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(14)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        }
        currentEventFrame.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.trailing.equalToSuperview().inset(13)
            $0.width.equalTo(91)
            $0.height.equalTo(84)
        }
    }

    private func setDelegate() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension EventReusableView {
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(startTimerCalled),
            name: .startTimer,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(stopTimerCalled),
            name: .stopTimer,
            object: nil
        )
    }

    @objc func startTimerCalled() {
        startTimer()
    }

    @objc func stopTimerCalled() {
        stopTimer()
    }

    private func startTimer() {
        guard !self.items.isEmpty else { return }
        self.autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.scrollToNextItem()
        }
    }

    private func stopTimer() {
        self.autoScrollTimer?.invalidate()
        self.autoScrollTimer = nil
    }

    private func scrollToNextItem() {
        let currentOffset = collectionView.contentOffset.y
        let itemHeight: CGFloat = 78
        let spacing: CGFloat = 88
        let nextItemIndex = Int((currentOffset + itemHeight) / spacing) + 1
        let nextItemOffset = CGPoint(
            x: 0,
            y: CGFloat(nextItemIndex) * spacing
        )
        collectionView.setContentOffset(
            nextItemOffset,
            animated: true
        )

        NotificationCenter.default.post(
            name: .currentEventID,
            object: nil,
            userInfo: [
                "currentEventID": items[nextItemIndex].id
            ]
        )
    }

    private func getHomeData() {
        let apiProvider = APIProvider<APITarget.All>()
        apiProvider.request(
            DTO.GetHomeResponse.self,
            target: .getHome
        ) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                var items: [EventOfTheMonth] = []
                var id = 0
                for i in 0..<response.data.monthlyEvents.subBanners.count * 3 {
                    items.append(EventOfTheMonth(id: id, item: response.data.monthlyEvents.subBanners[id]))
                    id = id == 2 ? 0 : id + 1
                }
                self.items = items
                self.initData = items
                self.totalItemCount = self.items.count
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            default:
                response.statusDescription()
            }
        }
    }
}

extension EventReusableView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: EventCell.cellIdentifier,
            for: indexPath
        ) as? EventCell
        else { return UICollectionViewCell() }
        let image = URL(string: items[indexPath.row].item)
        cell.bannerImageView.kf.setImage(with: image)
        if totalItemCount - indexPath.row == 6 {
            let addItem = initData
            totalItemCount += 3
            addItem.forEach {
                items.append($0)
            }
            collectionView.reloadData()
        }
        return cell
    }

    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let spacing: CGFloat = 88
        var offset = targetContentOffset.pointee
        let index = (offset.y + scrollView.contentInset.top) / spacing
        var roundedIndex = round(index)

        if scrollView.contentOffset.y > targetContentOffset.pointee.y {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }

        offset = CGPoint(
            x: 0,
            y: roundedIndex * spacing
        )
        targetContentOffset.pointee = offset

        NotificationCenter.default.post(
            name: .currentEventID,
            object: nil,
            userInfo: [
                "currentEventID": items[Int(roundedIndex)].id
            ]
        )
    }
}

extension EventReusableView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(
            width: 78,
            height: 78
        )
    }
}
