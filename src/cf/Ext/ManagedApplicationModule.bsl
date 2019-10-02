﻿
// СтандартныеПодсистемы

// Хранилище глобальных переменных.
//
// ПараметрыПриложения - Соответствие - хранилище переменных, где:
//   * Ключ - Строка - имя переменной в формате "ИмяБиблиотеки.ИмяПеременной";
//   * Значение - Произвольный - значение переменной.
//
// Инициализация (на примере СообщенияДляЖурналаРегистрации):
//   ИмяПараметра = "СтандартныеПодсистемы.СообщенияДляЖурналаРегистрации";
//   Если ПараметрыПриложения[ИмяПараметра] = Неопределено Тогда
//     ПараметрыПриложения.Вставить(ИмяПараметра, Новый СписокЗначений);
//   КонецЕсли;             
//  
// Использование (на примере СообщенияДляЖурналаРегистрации):
//   ПараметрыПриложения["СтандартныеПодсистемы.СообщенияДляЖурналаРегистрации"].Добавить(...);
//   ПараметрыПриложения["СтандартныеПодсистемы.СообщенияДляЖурналаРегистрации"] = ...;
Перем ПараметрыПриложения Экспорт;

// Конец СтандартныеПодсистемы


#Область ОбработчикиСобытий

Процедура ПередНачаломРаботыСистемы()
	
	// СтандартныеПодсистемы
	СтандартныеПодсистемыКлиент.ПередНачаломРаботыСистемы();
	// Конец СтандартныеПодсистемы
	
КонецПроцедуры

Процедура ПриНачалеРаботыСистемы()
	
	// СтандартныеПодсистемы
	СтандартныеПодсистемыКлиент.ПриНачалеРаботыСистемы();
	// Конец СтандартныеПодсистемы
	
	узОткрытьСправочникЗадачи();
	
	узОткрытьКанбанДоску();
	
КонецПроцедуры

Процедура узОткрытьСправочникЗадачи()
	Если ПараметрыПриложения.Количество() = 1 Тогда //ЭтоНачальноеЗаполнениеДанных
		Возврат;
	Конецесли;
	Если узОбщийМодульСервер.узОткрыватьСправочникЗадачиПриНачалеРаботыСистемы() Тогда
		ОткрытьФорму("Справочник.узЗадачи.Форма.ФормаСписка");
	Конецесли;
КонецПроцедуры 

Процедура узОткрытьКанбанДоску()
	Если ПараметрыПриложения.Количество() = 1 Тогда //ЭтоНачальноеЗаполнениеДанных
		Возврат;
	Конецесли;
	Если узОбщийМодульСервер.узОткрыватьКанбанДоскуПриНачалеРаботыСистемы() Тогда
		ОткрытьФорму("Обработка.узКанбанДоска.Форма.ФормаДинамическая");
	Конецесли;
КонецПроцедуры 

Процедура ПередЗавершениемРаботыСистемы(Отказ)
	
	// СтандартныеПодсистемы
	СтандартныеПодсистемыКлиент.ПередЗавершениемРаботыСистемы(Отказ);
	// Конец СтандартныеПодсистемы
	
КонецПроцедуры

#КонецОбласти

