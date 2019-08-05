//
//  PageTitleView.swift
//  DYZB
//
//  Created by 张昌伟 on 2019/8/5.
//  Copyright © 2019 zcw. All rights reserved.
//

import UIKit

private let kScrollLineH = 2.0

class PageTitleView: UIView {

    // 标题
    private var titles: [String]
    
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
            
            //设置frame
            let labelX: CGFloat = labelW * CGFloat(index)
            
            let frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            label.frame = frame
            scrollView.addSubview(label)
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
