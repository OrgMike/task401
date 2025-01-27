﻿
Функция НастройкиСоединения() Экспорт 
		
КонецФункции 

#Область Настройки
Функция ПараметрыНастроек()
	Ответ = Новый Структура ;
	Ответ.Вставить("Ключ","Обработка.РаботаСБонусами") ;
	Ответ.Вставить("Пользователь","Бонусы") ;
	
	Возврат  Ответ ;
	
КонецФункции 

Функция ВосстановитьНастройки() Экспорт
	УстановитьПривилегированныйРежим (Истина);
	ПараметрыНастроек = ПараметрыНастроек() ; 
	
	Настройки=  ХранилищеСистемныхНастроек.Загрузить(ПараметрыНастроек.Ключ,,,ПараметрыНастроек.Пользователь) ;
	Результат = Настройки <> Неопределено ;
	Если Результат Тогда  
		ЗаполнитьЗначенияСвойств(ЭтотОбъект,Настройки) ;
	КонецЕсли ;
		
	УстановитьПривилегированныйРежим (Ложь);
	Возврат результат ;
КонецФункции 	

Процедура СохранитьНастройки()Экспорт
	Настройки = Новый Структура() ;
	Настройки.Вставить("АдресСервера",АдресСервера) ;
	Настройки.Вставить("Логин",Логин) ;
	Настройки.Вставить("Пароль",Пароль) ;
	
	ПараметрыНастроек = ПараметрыНастроек() ; 
	ХранилищеСистемныхНастроек.Сохранить(ПараметрыНастроек.Ключ,,Настройки,,ПараметрыНастроек.Пользователь) ;
	
КонецПроцедуры 	

#КонецОбласти
