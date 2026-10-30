# Расчёт стоимости товара с учётом скидки

price = float(input("Введите первоначальную цену товара: "))
discount = float(input("Введите размер скидки (%): "))

final_price = price - (price * discount / 100)

print("Стоимость товара со скидкой:", final_price, "руб.")