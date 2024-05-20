//
//  HomeViewController.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import SnapKit

class HomeViewController: UIViewController {

    private var collectionView: UICollectionView? = nil
    private var eventCurrentImage: UIImage = GSImage.mockEvent1!
    private let gsNavigationBar = GSNavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeCollectionView()
        setStyle()
        setUI()
        setAutolayout()
        addObservers()
    }

    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = GSColor.grey02
    }

    private func setUI() {
        self.view.addSubview(gsNavigationBar)
    }

    override func viewDidAppear(_ animated: Bool) {
        startTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        stopTimer()
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
        return section.numberOfItems
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = HomeSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        return section.cellForItem(
            collectionView,
            indexPath,
            currentEventImage: eventCurrentImage
        )
    }
}
