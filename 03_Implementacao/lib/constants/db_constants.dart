import '../database/character.dart';
import '../database/item.dart';

enum Elements {
  AIR,
  FIRE,
  WATER,
  EARTH
}

enum Heroes {
  ADA_LOVELACE,  AFRODITE,  EUTERPE,  KAULU,        VALKIRIA,  WRIGHT_BROTHERS,
  DURGA,         ELFO,      HATHOR,   MARIE_CURIE,  MAUI,      THALIA,
  ANUBIS,        DIONISIO,  LONG_MU,  NAGA_KANYA,   POSEIDON,  TSUKUYOMI,
  AMATERASU,     FENIX,     HADES,    LOKI,         PELE,      SUN_WUKONG,

  DEFAULT_HERO
}

enum Relics {
  CHALICE,
  RING,
  MACE,
  SWORD,
  SHIELD,
  NECKLACE,
  FLAIL,
  PAN,
  CROWN,
  POTION,
  DEFAULT_RELIC
}

class DBConstants {

  static const dbName = "my_mythical_battles_project.db";
  static const dbVersion = 20;

  static const String typeOffense = 'Offense';
  static const String typeDefense = 'Defense';

  // ------------------------ USER ------------------------
  static const List<String> userColumns = [userIDCol, userPhoneCol, userNameCol,
    userLevelCol, userEXPCol, userFusionCol, userGemsCol, userTimeCol,
    userChapterCol, userPartCol, userFirstCol, userSecondCol, userThirdCol, userFourthCol];
  static const userTableName = "User";
  static const userIDCol = "UserId";
  static const userPhoneCol = "PhoneNumber";
  static const userNameCol = "Name";
  static const userLevelCol = "Level";
  static const userEXPCol = "ExpPoints";
  static const userFusionCol = "FusionPoints";
  static const userGemsCol = "Gems";
  static const userTimeCol = "TimeCollected";
  static const userChapterCol = "chapter_number";
  static const userPartCol = "chapter_part";
  static const userFirstCol = "first_hero";
  static const userSecondCol = "second_hero";
  static const userThirdCol = "third_hero";
  static const userFourthCol = "fourth_hero";
  static const createUserTable = '''
  CREATE TABLE User (
    UserId         VARCHAR (255) PRIMARY KEY
                                 NOT NULL,
    PhoneNumber    INT           UNIQUE
                                 CHECK (PhoneNumber >= 100000000 AND 
                                        PhoneNumber <= 999999999),
    Name           VARCHAR (60)  UNIQUE,
    Level          INT           DEFAULT (1) 
                                 NOT NULL,
    ExpPoints      INT           DEFAULT (0) 
                                 NOT NULL,
    FusionPoints   INT           DEFAULT (0) 
                                 NOT NULL,
    Gems           INT           DEFAULT (0) 
                                 NOT NULL,
    TimeCollected  VARCHAR (45),
    chapter_number INT           DEFAULT (1) 
                                 NOT NULL,
    chapter_part   INT           DEFAULT (1) 
                                 NOT NULL,
    first_hero     VARCHAR (60)  REFERENCES Hero (HeroId) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    second_hero    VARCHAR (60)  REFERENCES Hero (HeroId) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    third_hero     VARCHAR (60)  REFERENCES Hero (HeroId) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    fourth_hero    VARCHAR (60)  REFERENCES Hero (HeroId) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    FOREIGN KEY (
        chapter_number,
        chapter_part
    )
    REFERENCES Chapter (Number,
    Part) 
  );
  ''';

  // ---------------------- REWARD ----------------------
  static const List<String> rewardColumns = [rewardLevelCol, rewardTimeCol];
  static const rewardTableName = "Reward";
  static const rewardLevelCol = "Level";
  static const rewardTimeCol = "TimeLimit";
  static const createRewardTable = '''
  CREATE TABLE Reward (
    Level     INT          PRIMARY KEY
                           NOT NULL,
    TimeLimit VARCHAR (45) NOT NULL
  );
  ''';

  // ---------------------- CHARACTER ----------------------
  static const List<String> characterColumns = [characterNameCol, characterElementCol,
  characterTypeCol, characterTierCol, characterInitLifeCol, characterInitPowerCol,
    characterPhraseCol, characterSpecialCol, characterHistoryCol];
  static const characterTableName = "Character";
  static const characterNameCol = "Name";
  static const characterElementCol = "Element";
  static const characterTypeCol = "FighterType";
  static const characterTierCol = "Tier";
  static const characterInitLifeCol = "InitialLife";
  static const characterInitPowerCol = "InitialPower";
  static const characterPhraseCol = "Phrase";
  static const characterSpecialCol = "SpecialPower";
  static const characterHistoryCol = "History";
  static const createCharacterTable = ''' 
  CREATE TABLE Character (
    Name         VARCHAR (60)  PRIMARY KEY
                               NOT NULL,
    Element      VARCHAR (45)  NOT NULL
                               CHECK (Element = "Air" OR 
                                      Element = "Water" OR 
                                      Element = "Fire" OR 
                                      Element = "Earth"),
    FighterType  VARCHAR (45)  CHECK (FighterType = "Offense" OR 
                                      FighterType = "Defense") 
                               NOT NULL,
    Tier         INT           CHECK (Tier = 1 OR 
                                      Tier = 2 OR 
                                      Tier = 3) 
                               NOT NULL,
    InitialLife  INT           DEFAULT (1) 
                               NOT NULL,
    InitialPower INT           DEFAULT (1) 
                               NOT NULL,
    Phrase       VARCHAR (255),
    SpecialPower VARCHAR (255),
    History      VARCHAR (255) 
  );
  ''';

  // ------------------------ HERO ------------------------
  static const List<String> heroColumns = [heroIDCol, heroNameCol,
  heroLevelCol, heroLifeCol, heroPowerCol, heroRelicCol];
  static const heroTableName = "Hero";
  static const heroIDCol = "HeroId";
  static const heroNameCol = "hero_name";
  static const heroLevelCol = "Level";
  static const heroLifeCol = "Life";
  static const heroPowerCol = "Power";
  static const heroRelicCol = "relic_id";
  static const createHeroTable = ''' 
  CREATE TABLE Hero (
    HeroId    VARCHAR (255) PRIMARY KEY
                            NOT NULL,
    hero_name VARCHAR (60)  REFERENCES Character (Name) ON DELETE RESTRICT
                                                        ON UPDATE CASCADE
                            NOT NULL,
    Level     INT           DEFAULT (1) 
                            NOT NULL,
    Life      INT           DEFAULT (0)
                            NOT NULL,
    Power     INT           DEFAULT (0) 
                            NOT NULL,
    relic_id  VARCHAR (60)  REFERENCES Relic (RelicId) ON DELETE SET NULL
                                                       ON UPDATE CASCADE
  );
  ''';

  // ---------------------- USER_HERO ----------------------
  static const List<String> userHeroColumns = [userHeroUserCol, userHeroHeroCol];
  static const userHeroTableName = "User_Hero";
  static const userHeroUserCol = "user_id";
  static const userHeroHeroCol = "hero_id";
  static const createUserHeroTable = ''' 
  CREATE TABLE User_Hero (
    user_id VARCHAR (60) NOT NULL,
    hero_id VARCHAR (60) NOT NULL,
    PRIMARY KEY (
        user_id,
        hero_id
    ),
    FOREIGN KEY (
        user_id
    )
    REFERENCES User (UserId) ON DELETE CASCADE
                             ON UPDATE NO ACTION,
    FOREIGN KEY (
        hero_id
    )
    REFERENCES Hero (HeroId) ON DELETE CASCADE
                             ON UPDATE NO ACTION
  );
  ''';

  // ------------------------ ITEM ------------------------
  static const List<String> itemColumns = [itemNameCol, itemElementCol,
    itemInitLifeCol, itemInitPowerCol, itemHeroCol];
  static const itemTableName = "Item";
  static const itemNameCol = "Name";
  static const itemElementCol = "Element";
  static const itemInitLifeCol = "InitialLife";
  static const itemInitPowerCol = "InitialPower";
  static const itemHeroCol = "hero_owner";
  static const createItemTable = ''' 
  CREATE TABLE Item (
    Name         VARCHAR (60) PRIMARY KEY
                              NOT NULL,
    Element      VARCHAR (45) NOT NULL
                              CHECK (Element = "Air" OR 
                                     Element = "Water" OR 
                                     Element = "Fire" OR 
                                     Element = "Earth"),
    InitialLife  INT          DEFAULT (1) 
                              NOT NULL,
    InitialPower INT          DEFAULT (1) 
                              NOT NULL,
    hero_owner   VARCHAR (60) REFERENCES Character (Name) ON UPDATE CASCADE
);
  ''';

  // ------------------------ RELIC ------------------------
  static const List<String> relicColumns = [relicIDCol, relicNameCol,
  relicLevelCol, relicLifeCol, relicPowerCol];
  static const relicTableName = "Relic";
  static const relicIDCol = "RelicId";
  static const relicNameCol = "item_name";
  static const relicLevelCol = "Level";
  static const relicLifeCol = "Life";
  static const relicPowerCol = "Power";
  static const createRelicTable = ''' 
  CREATE TABLE Relic (
    RelicId   VARCHAR (255) PRIMARY KEY
                            NOT NULL,
    item_name VARCHAR (60)  REFERENCES Item (Name) ON DELETE RESTRICT
                                                   ON UPDATE CASCADE
                            NOT NULL,
    Level     INT           DEFAULT (1) 
                            NOT NULL,
    Life      INT           DEFAULT (0) 
                            NOT NULL,
    Power     INT           DEFAULT (0) 
                            NOT NULL
  );
  ''';

  // ---------------------- USER_RELIC ----------------------
  static const List<String> userRelicColumns = [userRelicUserCol, userRelicRelicCol];
  static const userRelicTableName = "User_Relic";
  static const userRelicUserCol = "user_id";
  static const userRelicRelicCol = "relic_id";
  static const createUserRelicTable = ''' 
  CREATE TABLE User_Relic (
    user_id  VARCHAR (60) NOT NULL,
    relic_id VARCHAR (60) NOT NULL,
    PRIMARY KEY (
        user_id,
        relic_id
    ),
    FOREIGN KEY (
        user_id
    )
    REFERENCES User (UserId) ON DELETE CASCADE
                             ON UPDATE NO ACTION,
    FOREIGN KEY (
        relic_id
    )
    REFERENCES Relic (RelicId) ON DELETE CASCADE
                               ON UPDATE NO ACTION
);
  ''';

  // ------------------------ CHAPTER ------------------------
  static const List<String> chapterColumns = [chapterCol, chapterPartCol,
    chapterLevelCol, chapterFirstCol, chapterSecondCol, chapterThirdCol, chapterFourthCol];
  static const chapterTableName = "Chapter";
  static const chapterCol = "Chapter";
  static const chapterPartCol = "Part";
  static const chapterLevelCol = "HeroLevel";
  static const chapterFirstCol = "first_enemy";
  static const chapterSecondCol = "second_enemy";
  static const chapterThirdCol = "third_enemy";
  static const chapterFourthCol = "fourth_enemy";
  static const createChapterTable = ''' 
  CREATE TABLE Chapter (
    Chapter      INT          NOT NULL,
    Part         INT          NOT NULL,
    HeroLevel    INT          NOT NULL
                              DEFAULT (1),
    first_enemy  VARCHAR (60) REFERENCES Character (Name) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    second_enemy VARCHAR (60) REFERENCES Character (Name) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    third_enemy  VARCHAR (60) REFERENCES Character (Name) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    fourth_enemy VARCHAR (60) REFERENCES Character (Name) ON DELETE SET NULL
                                                          ON UPDATE CASCADE,
    PRIMARY KEY (
        Chapter,
        Part
    ));
  ''';

  static const marieCurie = "Marie Curie";
  static Character marieCurieCharacter = Character(marieCurie, Elements.EARTH, typeOffense,
      2, 1, 3, phrase: 'Nothing in this world is to be feared, only understood');
  static const elfo = "Elfo";
  static Character elfoCharacter = Character(elfo, Elements.EARTH, typeDefense,
      2, 2, 2, phrase: 'I search for peace, but if you do not!');
  static const durga = "Durga";
  static Character durgaCharacter = Character(durga, Elements.EARTH, typeDefense,
      3, 3, 3, phrase: 'Harm my people and I will bring destruction upon you');
  static const hathor = "Hathor";
  static Character hathorCharacter = Character(hathor, Elements.EARTH, typeDefense,
      1, 3, 1, phrase: 'Yearn for growth and prosperity');
  static const thalia = "Thalia";
  static Character thaliaCharacter = Character(thalia, Elements.EARTH, typeDefense,
      2, 3, 1, phrase: 'You ll be laughing till death comes');
  static const maui = "Maui";
  static Character mauiCharacter = Character(maui, Elements.EARTH, typeOffense,
      1, 2, 3, phrase: 'You re welcome!');
  static const longMu = "Long Mu";
  static Character longMuCharacter = Character(longMu, Elements.WATER, typeDefense,
      1, 4, 2, phrase: 'You will not be with indifference from me');
  static const tsukuyomi = "Tsukuyomi";
  static Character tsukuyomiCharacter = Character(tsukuyomi, Elements.WATER, typeDefense,
      3, 4, 2, phrase: 'Disrespect will not be tolerated');
  static const nagaKanya = "Naga Kanya";
  static Character nagaKanyaCharacter = Character(nagaKanya, Elements.WATER, typeDefense,
      2, 3, 2, phrase: 'My venom will save you from this world');
  static const dionisio = "Dionisio";
  static Character dionisioCharacter = Character(dionisio, Elements.WATER, typeDefense,
      2, 2, 1, phrase: 'Wanna have some fun?');
  static const anubis = "Anubis";
  static Character anubisCharacter = Character(anubis, Elements.WATER, typeOffense,
      3, 3, 4, phrase: 'I ll lead you to the depths of darkness');
  static const poseidon = "Poseidon";
  static Character poseidonCharacter = Character(poseidon, Elements.WATER, typeOffense,
      1, 3, 4, phrase: 'Wish to see what the bottom of the Ocean looks like?');
  static const wrightBrothers = "Wright Brothers";
  static Character wrightBrothersCharacter = Character(wrightBrothers, Elements.AIR, typeOffense,
      1, 2, 3, phrase: 'This is a good day for a flight');
  static const kaulu = "Kaulu";
  static Character kauluCharacter = Character(kaulu, Elements.AIR, typeOffense,
      2, 1, 4, phrase: 'What delightful Chaos. Mesmerizing');
  static const valkiria = "Valkiria";
  static Character valkiriaCharacter = Character(valkiria, Elements.AIR, typeOffense,
      1, 2, 3, phrase: 'You cannot touch the sky as I am it');
  static const afrodite = "Afrodite";
  static Character afroditeCharacter = Character(afrodite, Elements.AIR, typeDefense,
      3, 4, 3, phrase: 'You ll always be with thirst for more');
  static const adaLovelace = "Ada Lovelace";
  static Character adaLovelaceCharacter = Character(adaLovelace, Elements.AIR, typeDefense,
      2, 3, 1, phrase: 'My comprehension can only be an infinitesimal fraction of all I want to understand');
  static const euterpe = "Euterpe";
  static Character euterpeCharacter = Character(euterpe, Elements.AIR, typeDefense,
      2, 3, 1, phrase: 'Dive into the depths of my melody');
  static const sunWukong = "Sun Wukong";
  static Character sunWukongCharacter = Character(sunWukong, Elements.FIRE, typeOffense,
      3, 2, 4, phrase: 'I know a talking pig smarter ');
  static const amaterasu = "Amaterasu";
  static Character amaterasuCharacter = Character(amaterasu, Elements.FIRE, typeDefense,
      3, 4, 3, phrase: 'Blindness will fall upon who dares to face me');
  static const hades = "Hades";
  static Character hadesCharacter = Character(hades, Elements.FIRE, typeOffense,
      3, 3, 5, phrase: 'Lets Fire up these souls ');
  static const loki = "Loki";
  static Character lokiCharacter = Character(loki, Elements.FIRE, typeOffense,
      1, 1, 3, phrase: 'Im gonna burn this place to the ground!');
  static const fenix = "Fenix";
  static Character fenixCharacter = Character(fenix, Elements.FIRE, typeOffense,
      3, 2, 4, phrase: 'May the light shine within you');
  static const pele = "Pele";
  static Character peleCharacter = Character(pele, Elements.FIRE, typeOffense,
      1, 2, 3, phrase: 'I ll burn all disrespectful souls of this earth');

  static Map<Heroes, Character> characters = {
    Heroes.AMATERASU:       amaterasuCharacter,
    Heroes.AFRODITE:        afroditeCharacter,
    Heroes.WRIGHT_BROTHERS: wrightBrothersCharacter,
    Heroes.ANUBIS:          anubisCharacter,
    Heroes.ADA_LOVELACE:    adaLovelaceCharacter,
    Heroes.DURGA:           durgaCharacter,
    Heroes.DIONISIO:        dionisioCharacter,
    Heroes.ELFO:            elfoCharacter,
    Heroes.EUTERPE:         euterpeCharacter,
    Heroes.FENIX:           fenixCharacter,
    Heroes.HADES:           hadesCharacter,
    Heroes.HATHOR:          hathorCharacter,
    Heroes.KAULU:           kauluCharacter,
    Heroes.LOKI:            lokiCharacter,
    Heroes.LONG_MU:         longMuCharacter,
    Heroes.MAUI:            mauiCharacter,
    Heroes.MARIE_CURIE:     marieCurieCharacter,
    Heroes.NAGA_KANYA:      nagaKanyaCharacter,
    Heroes.PELE:            peleCharacter,
    Heroes.POSEIDON:        poseidonCharacter,
    Heroes.SUN_WUKONG:      sunWukongCharacter,
    Heroes.THALIA:          thaliaCharacter,
    Heroes.TSUKUYOMI:       tsukuyomiCharacter,
    Heroes.VALKIRIA:        valkiriaCharacter};

  static const chalice =  "Chalice";
  static Item chaliceItem =  Item(chalice,  Elements.WATER, 2, 1, heroOwner: dionisioCharacter);
  static const ring =     "Ring";
  static Item ringItem =     Item(ring,     Elements.FIRE,  2, 1, heroOwner: sunWukongCharacter);
  static const mace =     "Mace";
  static Item maceItem =     Item(mace,     Elements.EARTH, 1, 2, heroOwner: elfoCharacter);
  static const sword =    "Sword";
  static Item swordItem =    Item(sword,    Elements.FIRE,  1, 2, heroOwner: amaterasuCharacter);
  static const shield =   "Shield";
  static Item shieldItem =   Item(shield,   Elements.WATER, 2, 1, heroOwner: tsukuyomiCharacter);
  static const necklace = "Necklace";
  static Item necklaceItem = Item(necklace, Elements.WATER, 2, 1, heroOwner: nagaKanyaCharacter);
  static const flail =    "Crookflail";
  static Item flailItem =    Item(flail,    Elements.WATER, 1, 2, heroOwner: anubisCharacter);
  static const pan =      "Pan";
  static Item panItem =      Item(pan,      Elements.AIR,   1, 2, heroOwner: kauluCharacter);
  static const crown =    "Crown";
  static Item crownItem =    Item(crown,    Elements.AIR,   2, 1, heroOwner: afroditeCharacter);
  static const potion =   "Potion";
  static Item potionItem =   Item(potion,   Elements.EARTH, 1, 2, heroOwner: marieCurieCharacter);

  static Map<Relics, Item> items = {
    Relics.CHALICE:  chaliceItem,
    Relics.CROWN:    crownItem,
    Relics.FLAIL:    flailItem,
    Relics.MACE:     maceItem,
    Relics.NECKLACE: necklaceItem,
    Relics.PAN:      panItem,
    Relics.POTION:   potionItem,
    Relics.RING:     ringItem,
    Relics.SHIELD:   shieldItem,
    Relics.SWORD:    swordItem
  };


  static Map<String, dynamic> insertReward1  = {rewardLevelCol: 1,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward2  = {rewardLevelCol: 2,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward3  = {rewardLevelCol: 3,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward4  = {rewardLevelCol: 4,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward5  = {rewardLevelCol: 5,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward6  = {rewardLevelCol: 6,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward7  = {rewardLevelCol: 7,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward8  = {rewardLevelCol: 8,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward9  = {rewardLevelCol: 9,  rewardTimeCol: "02:00:00"};
  static Map<String, dynamic> insertReward10 = {rewardLevelCol: 10, rewardTimeCol: "03:00:00"};
  static Map<String, dynamic> insertReward11 = {rewardLevelCol: 11, rewardTimeCol: "03:00:00"};

  static  Map<String, dynamic> chapter1p1  = {chapterCol: 1, chapterPartCol: 1,  chapterLevelCol: 1};
  static  Map<String, dynamic> chapter1p2  = {chapterCol: 1, chapterPartCol: 2,  chapterLevelCol: 1};
  static  Map<String, dynamic> chapter1p3  = {chapterCol: 1, chapterPartCol: 3,  chapterLevelCol: 2};
  static  Map<String, dynamic> chapter1p4  = {chapterCol: 1, chapterPartCol: 4,  chapterLevelCol: 2};
  static  Map<String, dynamic> chapter1p5  = {chapterCol: 1, chapterPartCol: 5,  chapterLevelCol: 3};
  static  Map<String, dynamic> chapter1p6  = {chapterCol: 1, chapterPartCol: 6,  chapterLevelCol: 3};
  static  Map<String, dynamic> chapter1p7  = {chapterCol: 1, chapterPartCol: 7,  chapterLevelCol: 3};
  static  Map<String, dynamic> chapter1p8  = {chapterCol: 1, chapterPartCol: 8,  chapterLevelCol: 4};
  static  Map<String, dynamic> chapter1p9  = {chapterCol: 1, chapterPartCol: 9,  chapterLevelCol: 4};
  static  Map<String, dynamic> chapter1p10 = {chapterCol: 1, chapterPartCol: 10, chapterLevelCol: 4};
  static  Map<String, dynamic> chapter2p1  = {chapterCol: 2, chapterPartCol: 1,  chapterLevelCol: 5};
  static  Map<String, dynamic> chapter2p2  = {chapterCol: 2, chapterPartCol: 2,  chapterLevelCol: 5};
  static  Map<String, dynamic> chapter2p3  = {chapterCol: 2, chapterPartCol: 3,  chapterLevelCol: 5};


// Map<Buttons, String> portugues = {Buttons.BATALHA: audioBatalha,
  //                                   Buttons.DEFINICOES: audioDefinicoes,
  //                                   Buttons.LOJA: audioLoja,
  //                                   Buttons.BOLSA: audioBolsa};
}
