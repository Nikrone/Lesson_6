//
//  ViewController.swift
//  Lesson_6
//
//  Created by Evgeniy Nosko on 4.08.21.
//

import UIKit

class ViewController: UIViewController {
   
    //        создание View КОДОМ
    var emptyViewCode: UIView = UIView()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var emptyView: UIView!
    
    
    //    ЗАГРУЗКА ЭКРАНА
    //    экран НАЧАЛСЯ загружаться (вызывается 1 раз)
    //    ХРАНИТСЯ - Логика, запросы в данных, загрузка данных с сервера и т.д!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
    }
    
    //    экран ПОЧТИ загрузился (вызывается бесконечно)
    //    ОБРАБАТЫВАЕТСЯ - весь код связанный с Пользовательским Интерфейсом!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        создание View КОДОМ
        emptyViewCode = UIView (
            frame: CGRect(
                x: 100,
                y: 100,
                width: 100,
                height: 100
            )
        )
        view.addSubview(emptyViewCode)
        emptyViewCode.backgroundColor = .orange
        emptyViewCode.layer.cornerRadius = 50

        
        
        print("viewWillAppear")
        //        layer - СЛОЙ - изменение UIView
        //        .cornerRadius - скругление радиуса
        button.layer.cornerRadius = 10
        emptyView.layer.cornerRadius = 10
        
        //        изменение границы View
        emptyView.layer.borderWidth = 1
        emptyView.layer.borderColor = UIColor.black.cgColor
        
        //        ТЕНЬ - (Clips to bounds - НЕ СТАВИТСЯ)
        //        цвет тени
        emptyView.layer.shadowColor = UIColor.black.cgColor
        //       направление тени
        emptyView.layer.shadowOffset = CGSize(width: 1, height: 1)
        //        распределение тени
        emptyView.layer.shadowRadius = 10
        //        прозрачность тени
        emptyView.layer.shadowOpacity = 0.3
    }
    
    
    
    
    //    экран ПОЛНОСТЬЮ загрузился (вызывается бесконечно)
    //    ВЫЗЫВАЕТСЯ - методы связанные с Анимацией!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        button.backgroundColor = .black
        view.backgroundColor = .yellow
        emptyView.backgroundColor = .white
        
        //  узнать координаты, размеры кнопки!
        print(button.frame.width)
        print(button.frame.height)
        print(button.bounds)
    
    
        //    изменение расположения View
            emptyViewCode.frame = CGRect (
                    x: 200,
                    y: 200,
                    width: 100,
                    height: 100
            )
        
//        origin - верхняя левая точка
        emptyViewCode.frame.origin = CGPoint(x: 300, y: 300)
        
//        center - центр
        emptyViewCode.center = CGPoint(x: 300, y: 300)
    }
    
    //  frame - расположение и размер view с использованием системы координат родительского представления (важно для размещения представления в superview).
    //  bounds - местоположение и размер представления с использованием его собственной системы координат (важно для размещения содержимого View или subview внутри него)
    
    

    

    
    
    
    
    //    СКРЫТИЕ ЭКРАНА
    //    Используются по необходимости!
    //   загрузка скрытие экрана (вызывается бесконечно)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    //     экран полностью скрылся (вызывается бесконечно)
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    

    
//    перемещение View на место тапа по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
//        получили координату места тапа
        let coordinate = (touches.first?.location(in: view))!
        emptyViewCode.center = coordinate
    }
    
//    плавное перемещение View на экране по тапу
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let coordinate = (touches.first?.location(in: view))!
        emptyViewCode.center = coordinate
    }
    
}

