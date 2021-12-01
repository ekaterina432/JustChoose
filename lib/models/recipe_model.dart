import 'package:flutter/material.dart';
import 'package:flutproj2/models/ingredient_model.dart';
import 'package:duration/duration.dart';
class RecipeModel{
  String title, description;
  Duration duration;
  int servings;
  List<Ingredient> ingredients;
  List<String> steps;
  String imgPath;
  double rating;
  RecipeModel({
    required this.title,
    required this.description,
    required this.duration,
    required this.servings,
    required this.ingredients,
    required this.steps,
    required this.imgPath ,
    required this.rating
  });
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

  /*Сюда добавляем рецепты для нулевой версии*/
  static List<RecipeModel> demoRecipes = [
    RecipeModel(
      title: 'Крабовый салат с креветками',
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
      title: 'Курица с луком в духовке',
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
      title: 'Чешский чесночный суп с гренками',
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
      title: 'Классические сырники из творога на сковороде',
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
  ];
}