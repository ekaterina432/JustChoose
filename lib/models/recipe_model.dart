import 'package:flutproj2/categories/category.dart';
import 'package:flutter/material.dart';
import 'package:flutproj2/models/ingredient_model.dart';
import 'package:duration/duration.dart';
import 'package:flutproj2/pages/favorites.dart';
import 'package:flutproj2/models/category_model.dart';

class RecipeModel{
  String title, description, id;
  Duration duration;
  CategoryModel category;
  int servings;
  List<Ingredient> ingredients;
  List<String> steps;
  String imgPath;
  double rating;
  bool _isFavorite;
  RecipeModel({
    required this.id,
    required this.category,
    required bool isFavorite,
    required this.title,
    required this.description,
    required this.duration,
    required this.servings,
    required this.ingredients,
    required this.steps,
    required this.imgPath ,
    required this.rating
  }) : _isFavorite = isFavorite;

  //Возвращает время приготовления в удобном для чтения формате
  String get getDurationString{
    String res = "";
    if (duration.inHours > 0) {
      res+="${duration.inHours} ч";
    }
    if (duration.inMinutes % Duration.minutesPerHour != 0){
      res+=" ${duration.inMinutes - duration.inHours * Duration.minutesPerHour} м";
    }
    return res;
  }

  bool get getIsFavorite{ return this._isFavorite;}

  void changeIsFavorite(){
    this._isFavorite = !this._isFavorite;
  }

  /*Сюда добавляем рецепты для нулевой версии*/
  static List<RecipeModel> demoRecipes = [
    RecipeModel(
      id:'1',
      isFavorite: false,
      title: 'Крабовый салат с креветками',
      category: Salads(),
      description:
      'Красиво, на скорую руку, очень вкусно, на праздничный стол! Крабовый салат с креветками вы приготовите за 30 минут максимум. Кроме майонеза, вы можете заправить его сметаной или натуральным йогуртом, сократив тем самым калорийность. Можете подать его на романтический ужин под белое вино.',
      duration: const Duration(minutes: 30),
      servings: 4,
      imgPath: 'assets/demo_recipe1.jpg',
      rating: 4.2,
      ingredients: [
        Ingredient(quantity: "200 гр.", title: "Крабовые палочки"),
        Ingredient(quantity: "200 гр.", title: "Креветки"),
        Ingredient(quantity: "200 гр.", title: "Пекинская китайская капуста"),
        Ingredient(quantity: "150 гр.", title: "Ананасы (консервированные)"),
        Ingredient(quantity: "100 гр.", title: "Гранат"),
        Ingredient(quantity: "80 гр.", title: "Твёрдый сыр"),
        Ingredient(quantity: "3 стол.л.", title: "Майонез"),
      ],
      steps: [
        "Подготовьте ингредиенты по списку. Пекинскую капусту помойте, обсушите и порвите ее на небольшие кусочки руками, используя только мягкую зеленую часть листьев.",
        "В большую кастрюлю налейте воды. Объем жидкости должен быть вдвое больше объема морепродуктов. Посолите обычной, а лучше морской солью (1 ст. л на 1 литр воды). Когда закипит, отправьте в кастрюлю неочищенные креветки. Доведите их до повторного закипания и сразу выключайте огонь. Небольшие креветки варятся не больше 2 минут. Королевские или тигровые - 3-7 минут.",
        "Следите за тем, чтобы не переварить креветки и не передержать их в горячей воде, иначе они не будут такими мягкими, как вам бы хотелось. Откиньте на дуршлаг, прополосните холодной водой или отправьте в миску со льдом. Охлажденные креветки очистите.",
        "Разберите спелый гранат на отдельные зернышки.",
        "Если используемые вами крабовые палочки заморожены, разморозьте их. Не снимая упаковку, выложите их на разделочную доску, пусть оттаивают. Теперь снимите целлофановую обертку. Если она плохо раскручивается, подержите палочки над паром в течение 1-3 секунд. Крабовые палочки нарежьте полукружьями.",
        "Консервированные ананасы откиньте из банки на дуршлаг, дайте сиропу стечь. Нарежьте фрукты небольшими кусочками.",
        "Твердый сыр нарежьте средними кубиками. Старайтесь нарезать крабовые палочки и сыр одинакового размера кубиками - так салат будет выглядеть красивее. Сыр можете взять любой, полутвердый, мягкий, по вашему вкусу.",
        "В салатнике подходящего размера соедините креветки, крабовые палочки, пекинскую капусту, ананасы и зерна граната.",
        "Заправьте салат майонезом и перемешайте. Заправку можете приготовить, смешав в равных пропорциях сметану и майонез или используя одну сметану, натуральный йогурт без добавок.",
      ],
    ),
    RecipeModel(
      id:'2',
      isFavorite: false,
      title: 'Курица с луком в духовке',
      category: BakedMeat(),
      description:
      'Простой рецепт с минимальным количеством ингредиентов! Приготовление курицы с луком в духовке не займет много времени. Основную работу делает техника, а вам остается наслаждаться готовым сытным и ароматным блюдом!',
      duration: const Duration(hours: 2, minutes: 10),
      servings: 3,
      rating: 3.7,
      imgPath: 'assets/demo_recipe2.jpg',
      ingredients: [
        Ingredient(quantity: "800 гр.", title: "Куриные ножки"),
        Ingredient(quantity: "2 шт.", title: "Лук репчатый"),
        Ingredient(quantity: "100 гр.", title: "Сметана"),
        Ingredient(quantity: "По вкусу", title: "Соль"),
        Ingredient(quantity: "По вкусу", title: "Специи сухие"),
      ],
      steps: [
        "Как сделать курицу с луком в духовке? Подготовьте для этого все необходимое. Для запекания можно взять любые части курицы. Я буду готовить куриные голени. Луковицы берите крупные. По вкусу курица отлично сочетается с луком.",
        "Лук очистите от шелухи и ополосните в холодной воде от загрязнений. Затем нарежьте очищенный лук полукольцами или чуть меньше. Сильно мелко резать не надо. Поместите нарезанный лук в чашу, в которой будете мариновать курицу.",
        "Курицу промойте в проточной воде и обсушите с помощью бумажного полотенца. Затем поместит курицу в чашу к луку. Следом добавьте сметану. Подсыпьте соли и специи по вкусу. В качестве специи можно ограничиться молотым перцев. Я к нему добавила еще немного паприки.",
        "Тщательно перемешайте курицу с луком и сметаной. Оставьте курочку мариноваться на 1-2 часа.",
        "Для запекания возьмите любую жаропрочную форму. У меня керамическая. Маринованный лук выложите по дну формы для запекания ровным слоем.",
        "Сверху выложите курицу. Накройте форму фольгой и поставьте в духовку, предварительно разогретую до 190 градусов на 30-40 минут. Затем снимите лист фольги и оставьте курицу готовиться в духовке еще на 30-40 минут. За это время она успеет подрумяниться.",
        "Румяную курочку извлеките из духовки, разложите по тарелкам и подавайте к столу. В дополнение можно приготовить гарнир из картофеля. Приятного аппетита!",
      ],
    ),
    RecipeModel(
      id:'3',
      isFavorite: false,
      title: 'Чешский чесночный суп с гренками',
      category: FirstUnusual(),
      description:
      'Простой, сытный и ароматный, на скорую руку! Чесночный суп с гренками или чеснечка - это настоящая радость для ценителей чешской национальной кухни и просто для гурманов. Готовится очень быстро! А во время варки по всему дому стоит непередаваемый аромат чеснока и копченостей.',
      duration: const Duration(hours: 1, minutes: 20),
      servings: 5,
      rating: 4.8,
      imgPath: 'assets/demo_recipe3.jpg',
      ingredients: [
        Ingredient(quantity: "1.5 л.", title: "Мясной бульон"),
        Ingredient(quantity: "500 гр.", title: "Свиные ребрышки (копченые)"),
        Ingredient(quantity: "50 гр.", title: "Твёрдый сыр"),
        Ingredient(quantity: "50 гр.", title: "Хлеб (гренки)"),
        Ingredient(quantity: "2 шт.", title: "Картошка"),
        Ingredient(quantity: "40 гр.", title: "Чеснок (1 головка)"),
        Ingredient(quantity: "1 шт.", title: "Яйца"),
        Ingredient(quantity: "5 гр.", title: "Майоран (1 чайная ложка)"),
        Ingredient(quantity: "По вкусу", title: "Перец черный молотый"),
        Ingredient(quantity: "По вкусу", title: "Соль"),
      ],
      steps:[
        "Как сварить ароматный чешский чесночный суп с гренками? Очень быстро! Для начала подготовьте необходимые ингредиенты по списку. Свиные ребрышки продаются в разном виде у разных производителей. Нам нужны те, где между костями есть мясо. Ребрышки в виде отдельных обрезанных от лишнего мяса костей в этот суп не подойдут.",
        "Картофель очистите от кожуры и нарежьте небольшими кубиками.",
        "С копченых ребрышек срежьте мясо. Кости можете оставить для другого супа. Из них получится насыщенный бульон. Если варите суп не на бульоне, а на воде, то предварительно после закипания воды можете бросить в кастрюлю очищенные от мяса кости и проварить 10 минут. Так у вас получится бульон, на основе которого дальше можно варить суп.",
        "Сыр натрите на средней терке. Сыр можете брать любой. У меня Тильзитер.",
        "Головку чеснока разберите на зубчики. Каждый зубчик очистите от шелухи. Натрите зубчики на мелкой терке или пропустите через пресс.",
        "Яйцо взбейте вилкой до соединения белка с желтком.",
        "Мясной бульон доведите до кипения. Выложите нарезанное мясо с ребрышек, картофель и чеснок. Перемешайте. Варите 15-20 минут на среднем огне (у меня режим 5 из 9).",
        "Суп посолите, всыпьте черный молотый перец и сушеный майоран.",
        "При постоянном помешивании тонкой струйкой влейте в суп взбитое яйцо. Проварите 1 минуту.",
        "Выключите огонь и дайте супу настояться под крышкой 10-15 минут.",
        "Разлейте суп по тарелкам. Добавьте в каждую тертый сыр и гренки. Очень интересной будет подача в корзинке из ржаного хлеба. Нужно срезать у хлеба верхушку, аккуратно вынуть мякоть, оставив немного на стенках. Влить чесночный суп и сразу же подать к столу. Приятного аппетита!",
      ],
    ),
    RecipeModel(
      id:'4',
      isFavorite: false,
      title: 'Классические сырники из творога на сковороде',
      category: Deserts(),
      description:
      'Классический рецепт пышных, нежных сырников! Пышные сырники приготовить не так то и просто! Часто они получаются плоскими или непропеченными. Предлагаю вам классический рецепт этой выпечки!',
      duration: const Duration(minutes: 30),
      servings: 4,
      rating: 4.9,
      imgPath: 'assets/demo_recipe4.jpg',
      ingredients: [
        Ingredient(quantity: "300 гр.", title: "Творог"),
        Ingredient(quantity: "1 шт.", title: "Яйца"),
        Ingredient(quantity: "По вкусу", title: "Соль"),
        Ingredient(quantity: "1 стол. л.", title: "Сахар"),
        Ingredient(quantity: "1 стол. л.", title: "Мука"),
        Ingredient(quantity: "100 мл.", title: "Растительное масло"),
      ],
      steps:[
        "Подготовьте все необходимые продукты. Залог вкусных сырников качественный творог. Обязательно берите натуральный творог, без заменителя молочного жира. На мой взгляд вкуснее сырники из более жирного творог 9-18%. Яйца также используйте крупные, свежие, желательно домашние. Я предпочитаю жарить сырники на любом растительном масле, но можно также жарить и на сливочном, и на топленом масле.",
        "Творог разомните вилкой. Смотрите по консистенции творога: если он как бы с крупинками, то лучше всего будет протереть его через мелкое сито, тогда текстура творога станет более однородной.",
        "Вбейте в творог яйцо.",
        "Хорошо размешайте все вилкой.",
        "Посолите и еще раз перемешайте.",
        "Добавьте сахар. Я использую обычный белый сахар, но можно готовить и с коричневым сахаром, - он придаст сырникам карамельный вкус. Также на этой стадии можно добавить в тесто и какие-то любимые вами ароматизаторы. Ваниль или ванильный сахар, а также корицу - дети особенно любят выпечку с запахом ванили.",
        "Просейте муку (1 ст.л. муки оставьте для панировки). Рекомендую не пренебрегать этим процессом, т.к. во время просеивания мука насыщается кислородом и готовые сырники получатся более воздушные и нежные. Также рекомендую использовать в выпечке муку не высшего, а первого и второго сорта, т.к. мука высшего сорта часто бывает выбелена с помощью хлора. Хорошо перемешайте тесто.",
        "Берите немного теста, формируйте небольшую лепешечку.",
        "Обваливайте со всех сторон в оставшейся муке. Таким образом используйте все тесто.",
        "В сковороде хорошо разогрейте масло. Если вы готовите на растительном масле, используйте рафинированное масло, - оно не будет пригорать на сковороде. Выложите сырники и готовьте на небольшом огне около 7 минут с одной стороны.",
        "Затем аккуратно переверните сырники и готовьте также минут 7-10. Возможно понадобится накрыть сковороду крышкой и довести сырники до полной готовности, чтобы серединка тоже пропеклась.",
        "Подавайте сырники на завтрак, полдник или просто к чаю. Приятного аппетита!",
      ],
    ),
    RecipeModel(
      title: 'Котлеты по киевски',
      category: FriedMeat(),
      id:'5',
      isFavorite: false,
      description:
      'Котлета по-киевски — тонкая хрустящая панировка, сочная куриная грудка и полость внутри, из которой вытекает ароматное сливочное масло — очень вкусно! Эта сочная котлетка знакома многим, жаль только, что в настоящее время она стала обыденным фаст-фудом, утратила свою изысканность и незабываемый вкус.',
      duration: const Duration(minutes: 30),
      servings: 6,
      rating: 4.9,
      imgPath: 'assets/demo_recipe5.jpg',
      ingredients: [
        Ingredient(quantity: "800 гр.", title: "Куриное филе"),
        Ingredient(quantity: "По вкусу", title: "Соль"),
        Ingredient(quantity: "По вкусу", title: "Черный перец молотый"),
        Ingredient(quantity: "100 гр.", title: "Сливочное масло"),
        Ingredient(quantity: "2 шт.", title: "Яйцо"),
        Ingredient(quantity: "2 ст.л.", title: "Мука"),
        Ingredient(quantity: "1 стакан", title: "Панировочные сухари"),
        Ingredient(quantity: "0.5 л.", title: "Растительное масло"),
      ],
      steps: [
        "Масло разрежьте на 4 кусочка, разложите их на тарелке так, чтобы не слиплись и отправьте в морозильную камеру, чтобы они хорошо замёрзли — это главная хитрость — замороженное масло при жарке будет таять медленнее, не начнёт кипеть внутри котлеты и стремиться вырваться наружу.",
        "Грудку разрежьте вдоль пополам не дорезая до конца, затем разверните в обе стороны — получается большой, тонкий кусочек.",
        "Положите филе в пакет, чтобы брызги не летели во все стороны, и отбейте. Проделайте это со всеми грудками.",
        "Отбитое филе посолите, поперчите, заверните в него замороженное сливочное масло и сформируйте котлеты.",
        "Приготовьте панировку: взбейте слегка яйца, насыпьте в разные ёмкости муку и панировочные сухари.",
        "Котлету обваляйте в муке, окуните в яйца и обваляйте в сухарях. Для прочности панировки повторите весь процесс ещё раз: мука, яйцо, сухари.",
        "Сформированные котлеты уберите в морозильную камеру на 15-20 минут.",
        "Жарить котлеты по-киевски надо в большом количестве растительного масла во фритюрнице или в глубокой сковороде. Не жалейте масла и хорошо его разогрейте. В достаточно горячем масле котлеты жарятся всего 5-7 минут. Переверните котлету в процессе жарки, чтобы она подрумянилась со всех сторон.",
      ]
    ),
    RecipeModel(
      id:'6',
      isFavorite: false,
      title: 'Солянка с копчёностями',
      category: FirstUnusual(),
      description:
      'Приготовить солянку стоит уже ради того, чтобы почувствовать этот умопомрачительный запах, который пробуждает аппетит и острое желание съесть и свою, и чужую порцию. Благо, наш рецепт рассчитан на целых 8 порций, так что вы вполне можете взять себе добавку!',
      duration: const Duration(hours: 1, minutes: 40),
      servings: 8,
      rating: 5.0, 
      imgPath: 'assets/demo_recipe6.jpg',
      ingredients: [
        Ingredient(quantity: "3.5 л", title: "Вода"),
        Ingredient(quantity: "500 гр.", title: "Свиные рёбрышки"),
        Ingredient(quantity: "400 гр.", title: "Картошка"),
        Ingredient(quantity: "350 гр.", title: "Копчёная грудинка"),
        Ingredient(quantity: "200 гр.", title: "Солёные огурцы"),
        Ingredient(quantity: "2 шт.", title: "Репчатый лук"),
        Ingredient(quantity: "2 шт.", title: "Морковь"),
        Ingredient(quantity: "50 гр.", title: "Томатная паста"),
        Ingredient(quantity: "40 мл", title: "Растительное масло"),
        Ingredient(quantity: "2 шт.", title: "Лавровый лист"),
        Ingredient(quantity: "По вкусу", title: "Соль"),
        Ingredient(quantity: "По вкусу", title: "Чёрный перец молотый"),
        Ingredient(quantity: "По вкусу", title: "Лимон"),
        Ingredient(quantity: "По вкусу", title: "Оливки"),
      ],
      steps: [
          "Очистите лук, картофель и морковь. Одну луковицу нарежьте мелкими кубиками, картофель — крупными, огурцы — соломкой. Одну морковь натрите на крупной терке, грудинку нарежьте средними кубиками.",
          "Свиные ребра залейте водой, добавьте разрезанные пополам луковицу и морковь. Доведите до кипения и варите на медленном огне в течение 60 минут.",
          "Достаньте ребрышки и нарежьте их по кости. Бульон процедите в другую кастрюлю.",
          "В бульон выложите картошку и варите в течение 20 минут.",
          "На сковороде с разогретым маслом обжаривайте, помешивая, тертую морковь, нарезанные лук, огурцы и грудинку около 7 минут. Затем добавьте томатную пасту и тушите еще 2 минуты.",
          "Все ингредиенты со сковороды переложите в кастрюлю с бульоном, добавьте лавровый лист, посолите, поперчите и варите около 10 минут.",
          "Добавьте в суп мясо, снимите с огня, накройте кастрюлю крышкой и оставьте на 15 минут, после подавайте c ломтиками лимона и оливками."
      ]
    ),
    RecipeModel(
      id: '7',
      isFavorite: false,
      title: 'Ягодно-фруктовый десерт',
      category: Deserts(),
      description:
      'Невероятно вкусный и простой рецепт ягодно-фруктового десерта без выпечки. Такой красивый десерт можно подать даже самым искушенным ценителям.',
      duration: const Duration(minutes: 30),
      servings: 8,
      rating: 4.7,
      imgPath: 'assets/demo_recipe7.jpg',
      ingredients: [
        Ingredient(quantity: '60 гр.', title: 'Сливочное масло'),
        Ingredient(quantity: '150 гр.', title: 'Печенье "Юбилейное"'),
        Ingredient(quantity: '1 столовая ложка', title: 'Желатин'),
        Ingredient(quantity: '500 гр.', title: 'Клубничный йогурт'),
        Ingredient(quantity: '1/2 стакана', title: 'Сахар'),
        Ingredient(quantity: '500 гр.', title: 'Замороженные ягоды'),
        Ingredient(quantity: '200 гр.', title: 'Сливки'),
        Ingredient(quantity: '100 гр.', title: 'Клюква')
      ],
      steps: [
        "Печенье смолоть блендером в крошку и смешать с маслом, полученное тесто выложить в форму, разровнять и спрятать в холодильник.",
        "Ягоды разморозить, сок слить. В соке развести желатин, дать набухнуть минут 30–40 и подогреть до полного растворения (не доводить до кипения!).",
        "В ягоды добавить сахар, несильно размолоть блендером, смешать с йогуртом, добавить желатин, подождать, пока чуть схватиться, и вылить в форму с основой.",
        "Дать застыть в холодильнике.",
        "Для более праздничного варианта можно взбить 200 мл жирных сливок (не меньше 30%) и добавить в суфле после желатина. Вкус станет еще более сливочным.",
        "Посыпьте десерт клюквой. Безумно вкусный десерт готов!",
      ]
    ),
    RecipeModel(
      id: '8',
      isFavorite: false,
      title: 'Брауни',
      category: Deserts(),
      description:
      'Один из самых популярных десертов в мире — брауни — был придуман в 1893 году на кухне легендарного отеля Palmer House в Чикаго. Этот пирог там пекут до сих пор по оригинальному рецепту, покрывая сверху абрикосовой глазурью. В домашней версии, впрочем, у брауни получается такая изумительная сахарная корочка, что глазировать ее было бы преступлением. У традиционных шоколадных брауни ванильный аромат, хрустящая корочка и влажная серединка.',
      duration: const Duration(minutes: 45),
      servings: 6,
      rating: 4.9,
      imgPath: 'assets/demo_recipe8.jpg',
      ingredients: [
        Ingredient(quantity: '100 гр.', title: 'Тёмный шоколад'),
        Ingredient(quantity: '180 гр.', title: 'Сливочное масло'),
        Ingredient(quantity: '200 гр.', title: 'Коричневый сахар'),
        Ingredient(quantity: '4 шт.', title: 'Куриное яйцо'),
        Ingredient(quantity: '100 гр.', title: 'Пшеничная мука'),
        Ingredient(quantity: '100 гр.', title: 'Грецкие орехи'),
      ],
      steps : [
        "Шоколад разломать на кусочки и вместе со сливочным маслом растопить на водяной бане, не переставая все время помешивать лопаткой или деревянной ложкой. Получившийся густой шоколадный соус снять с водяной бани и оставить остывать.",
        "Тем временем смешать яйца со ста граммами коричневого сахара: яйца разбить в отдельную миску и взбить, постепенно добавляя сахар. Взбивать можно при помощи миксера или вручную — как больше нравится, — но не меньше двух с половиной-трех минут.",
        "Острым ножом на разделочной доске порубить грецкие орехи. Предварительно их можно поджарить на сухой сковороде до появления аромата, но это необязательная опция.",
        "В остывший растопленный со сливочным маслом шоколад аккуратно добавить оставшийся сахар, затем муку и измельченные орехи и все хорошо перемешать венчиком.",
        "Затем влить сахарно-яичную смесь и тщательно смешать с шоколадной массой. Цвет у теста должен получиться равномерным, без разводов.",
        "Разогреть духовку до 200 градусов. Дно небольшой глубокой огнеупорной формы выстелить листом бумаги для выпечки или калькой. Перелить тесто в форму. Поставить в духовку и выпекать двадцать пять — тридцать минут до появления сахарной корочки.",
        "Подавать брауни можно просто так, а можно посыпать сверху сахарной пудрой или разложить квадратики по тарелкам и украсить каждую порцию шариком ванильного мороженого.",
      ]
    ),
    RecipeModel(
        id: '9',
        isFavorite: false,
        title: 'Безалкогольный глинтвейн',
        category: Drinks(),
        description:
        'Зима уже близко, а это значит, что настало время вспомнить о напитке, который поможет нам согреться. Глинтвейн — это не только вкусно, но и полезно. Особенно, если без алкоголя.',
        duration: const Duration(minutes: 30),
        servings: 6,
        rating: 4.2,
        imgPath: 'assets/demo_recipe9.jpg',
        ingredients: [
          Ingredient(quantity: "1 л", title: "Фруктовый сок"),
          Ingredient(quantity: "200 мл", title: "Вода"),
          Ingredient(quantity: "2 шт.", title: "Яблоко"),
          Ingredient(quantity: "1 шт.", title: "Апельсин"),
          Ingredient(quantity: "4 ст. л.", title: "Изюм"),
          Ingredient(quantity: "2 см", title: "Ломтик корня имбиря"),
          Ingredient(quantity: "2 звёздочки", title: "Бадьян"),
          Ingredient(quantity: "3 бутона", title: "Гвоздика"),
          Ingredient(quantity: "2 зёрнышка", title: "Кардамон"),
          Ingredient(quantity: "Щепотка", title: "Корица"),
          Ingredient(quantity: "Щепотка", title: "Мускатный орех"),
          Ingredient(quantity: "По вкусу", title: "Мёд")
        ],
        steps: [
          "Разрезать апельсин пополам и отрезать от него несколько круглых долек по количеству гостей (для украшения)",
          "Оставшийся апельсин и яблоко нарезать кубиками, имбирь потереть на терке, добавить все специи, залить водой и поставить на огонь.",
          "Далее на усмотрение: либо вскипятить и оставить на час настаиваться, либо протомить около 10 минут на медленном огне.",
          "Когда приправы раскроют свой аромат можно добавить сок.",
          "Как только пойдут первые пузырьки и пар, глинтвейн нужно снять с огня."
        ]
    ),
    RecipeModel(
      id: '10',
      isFavorite: false,
      title: 'Безалкогольное мохито',
      category: Drinks(),
      description:
      'Это один из самых классических рецептов безалкогольного мохито, который очень освежает в жару.',
      duration: const Duration(minutes: 10),
      servings: 1,
      rating: 4.4,
      imgPath: 'assets/demo_recipe10.jpg',
      ingredients: [
        Ingredient(quantity: "10 гр.", title: "Свежая мята"),
        Ingredient(quantity: "Половинка", title: "Лайм"),
        Ingredient(quantity: "150 мл", title: "Спрайт"),
        Ingredient(quantity: "8 кусков", title: "Лёд"),
        Ingredient(quantity: "1 ч. л.", title: "Тростниковый сахар")
      ],
      steps: [
        "Нарезаем лайм и кладем в бокал.",
        "Добавляем мяту, тростниковый сахар и разминаем.",
        "Добавляем ледяную крошку и перекладываем смесь в шейкер. Взбиваем.",
        "Перекладываем в бокал и заливаем спрайтом.",
        "Декорируем коктейль листиком мяты и лаймом — напиток готов."
      ]
    ),
    RecipeModel(
      id: '11',
      isFavorite: false,
      title: 'Куриная грудка в сметанном соусе',
      category: BakedMeat(),
      description: 'Так запеченная курица получается очень мягкой и совсем не сухой.',
      duration: const Duration(hours: 1, minutes: 20),
      servings: 1,
      rating: 4.7,
      imgPath: 'assets/demo_recipe11.jpg',
      ingredients: [
      Ingredient(quantity: "500 гр.", title: "Куриное филе"),
      Ingredient(quantity: "половина", title: "болгарский перец"),
      Ingredient(quantity: "50 гр.", title: "сыр"),
      Ingredient(quantity: "щипотка", title: "Специи"),
      Ingredient(quantity: "200 гр.", title: "Сметана"),
      Ingredient(quantity: "4", title: "Зубчика чеснока"),
      Ingredient(quantity: "1 ст.л.", title: "Лимонный сок")
      ],
      steps: [
      "Промой филе, сделай несколько надрезов и обваляй курицу в специях.",
      "В надрезы вложи полосочки перца и отправь курицу в форму.",
      "Смешай сметану, лимонный сок, измельченный чеснок и специи по вкусу, залей курицу, присыпь сыром и выпекай около 40 минут при 180 градусах."
      ]
    ),
  ];
}
