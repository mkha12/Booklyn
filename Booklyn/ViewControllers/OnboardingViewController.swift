import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func onboardingDidFinish()
}


final class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    var completionHandler: (() -> Void)?
    var pages: [OnboardingPage] = [
        OnboardingPage(title: "Не знаете что почитать? Мы поможем", description: "", image: UIImage(named: "bibl1")!),
        OnboardingPage(title: "Выбирайте книги из списка лучшей литературы", description: "", image: UIImage(named: "bibl2")!)
    ]
    
    
    lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = pages.count
        control.currentPage = 0
        control.pageIndicatorTintColor = .gray
        control.currentPageIndicatorTintColor = .blue
        return control
    }()
    weak var onboardingDelegate: OnboardingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialController = viewController(at: 0) {
            setViewControllers([initialController], direction: .forward, animated: true, completion: nil)
        }
        
        setupPageControl()
    }
    
    
    
    func viewController(at index: Int) -> OnboardingPageController? {
        if index < pages.count {
            let vc = OnboardingPageController()
            vc.page = pages[index]
            vc.index = index
            vc.completionHandler = { [weak self] in
                let trackersVC = BooksViewController()
                self?.present(trackersVC, animated: true, completion: nil)
            }
            return vc
        }
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? OnboardingPageController, let currentIndex = viewController.index {
            return self.viewController(at: currentIndex - 1)
        }
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? OnboardingPageController, let currentIndex = viewController.index {
            return self.viewController(at: currentIndex + 1)
        }
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        if completed, let currentVC = pageViewController.viewControllers?.first as? OnboardingPageController, let index = currentVC.index {
            pageControl.currentPage = index
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let currentVC = pageViewController.viewControllers?.first as? OnboardingPageController, let index = currentVC.index {
            return index
        }
        return 0
    }
    
    
    func setupPageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

