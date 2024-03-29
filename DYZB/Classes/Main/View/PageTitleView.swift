//
//  PageTitleView.swift
//  DYZB
//
//  Created by 张昌伟 on 2019/8/5.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let kScrollLineH = 2.0
private var kNormalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private var kSelectColor: (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

protocol PageTitleViewDelegate: class {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int)
}

class PageTitleView: UIView {

    // 标题
    private var titles: [String]
    private var titlesLabel = [UILabel]()
    private var currentIndex = 0
    weak var delegate: PageTitleViewDelegate?
    
    // 懒加载属性
    private lazy var scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        
        return scrollView
    }()
    
    private lazy var scrollLine: UIView = {
        
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    // MARK: 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: 设置界面
extension PageTitleView {
    
    private func setupUI(){
        
        addSubview(scrollView)
        scrollView.frame = self.bounds
        
        setupTitleLabel()
        
        setupBottonMenuAndScrollLine()
    }
    
    // 设置Label
    private func setupTitleLabel() {
        
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - CGFloat(kScrollLineH)
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 设置Label属性
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 15)
            label.textAlignment = .center
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            
            //设置frame
            let labelX: CGFloat = labelW * CGFloat(index)
            
            let frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            label.frame = frame
            scrollView.addSubview(label)
            
            // 添加手势
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClickAction(tapGes:)))
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(tapGes)
            
            titlesLabel.append(label)
        }
    }
    
    // 设置底线和滚动条
    private func setupBottonMenuAndScrollLine() {
        // 底线
        let bottonLine = UIView(frame: CGRect(x: 0, y: frame.height - 0.5, width: frame.width, height: 0.5))
        bottonLine.backgroundColor = .darkGray
        addSubview(bottonLine)
        
        // 滚动条
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: 0, y: Double(frame.height) - kScrollLineH - 0.5, width: Double(frame.width) / Double(titles.count), height: kScrollLineH)
    }
}

// MARK: label点击事件
extension PageTitleView {
    
    @objc private func titleLabelClickAction(tapGes: UITapGestureRecognizer) {
        
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        let oldLabel = titlesLabel[currentIndex]
        currentIndex = currentLabel.tag
        
        // 修改文字颜色和滚动条位置
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        UIView.animate(withDuration: 0.3) {
            self.scrollLine.frame.origin.x = self.scrollLine.frame.width * CGFloat(self.currentIndex)
        }
        
        // 通知代理
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

// MARK:对外暴露的方法
extension PageTitleView {
    
    func setupTitleWithProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        currentIndex = targetIndex
        
        let sourceLabel = titlesLabel[sourceIndex]
        let targetLabel = titlesLabel[targetIndex]
        
        // 滑块逻辑
        let moveToTalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveToTalX * progress
        
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
    }
}
