
class CategoryModel{}

class FirstCourseModel extends CategoryModel{} // Первое блюдо
  class FirstClassic extends FirstCourseModel{} // Классика
  class FirstUnusual extends FirstCourseModel{} // Нестандартное

class SecondCourseModel extends CategoryModel{} // Второе блюдо
  class Salads extends SecondCourseModel{} // Салаты
  class BakedModel extends SecondCourseModel{} // Запеченное
    class BakedMeat extends BakedModel{} // Мясо и птица
    class BakedSeafood extends BakedModel{} // Морепродукты
    class BakedVeget extends BakedModel{} // Овощи
  class FriedModel extends SecondCourseModel{} // Жареное
    class FriedMeat extends FriedModel{} // Мясо и птица
    class FriedSeafood extends FriedModel{} // Морепродукты
    class FriedVeget extends FriedModel{} // Овощи
  class Boiled extends SecondCourseModel{} // Вареное
class Deserts extends CategoryModel{} // Десерты
class Snacks extends CategoryModel{} // Закуски
class Drinks extends CategoryModel{} // Напитки