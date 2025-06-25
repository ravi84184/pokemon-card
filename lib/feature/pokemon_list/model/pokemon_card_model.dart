class PokemonCardModel {
  String? id;
  String? name;
  String? supertype;
  List<String>? subtypes;
  String? level;
  String? hp;
  List<String>? types;
  String? evolvesFrom;
  List<Abilities>? abilities;
  List<Attacks>? attacks;
  List<Weaknesses>? weaknesses;
  List<Weaknesses>? resistances;
  List<String>? retreatCost;
  int? convertedRetreatCost;
  Set? set;
  String? number;
  String? artist;
  String? rarity;
  String? flavorText;
  List<int>? nationalPokedexNumbers;
  Legalities? legalities;
  ImagesModel? images;
  Tcgplayer? tcgplayer;
  Tcgplayer? cardmarket;
  List<String>? evolvesTo;
  List<String>? rules;

  PokemonCardModel({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.level,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.set,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
    this.evolvesTo,
    this.rules,
  });

  PokemonCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supertype = json['supertype'];
    subtypes =
        json['subtypes'] != null ? List<String>.from(json['subtypes']) : null;
    level = json['level'];
    hp = json['hp'];
    types = json['types'] != null ? List<String>.from(json['types']) : null;
    evolvesFrom = json['evolvesFrom'];
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    if (json['attacks'] != null) {
      attacks = <Attacks>[];
      json['attacks'].forEach((v) {
        attacks!.add(Attacks.fromJson(v));
      });
    }
    if (json['weaknesses'] != null) {
      weaknesses = <Weaknesses>[];
      json['weaknesses'].forEach((v) {
        weaknesses!.add(Weaknesses.fromJson(v));
      });
    }
    if (json['resistances'] != null) {
      resistances = <Weaknesses>[];
      json['resistances'].forEach((v) {
        resistances!.add(Weaknesses.fromJson(v));
      });
    }
    // retreatCost = json['retreatCost'].cast<String>();
    convertedRetreatCost = json['convertedRetreatCost'];
    set = json['set'] != null ? Set.fromJson(json['set']) : null;
    number = json['number'];
    artist = json['artist'];
    rarity = json['rarity'];
    flavorText = json['flavorText'];
    nationalPokedexNumbers = json['nationalPokedexNumbers'] != null
        ? List<int>.from(json['nationalPokedexNumbers'])
        : null;
    legalities = json['legalities'] != null
        ? Legalities.fromJson(json['legalities'])
        : null;
    images =
        json['images'] != null ? ImagesModel.fromJson(json['images']) : null;
    tcgplayer = json['tcgplayer'] != null
        ? Tcgplayer.fromJson(json['tcgplayer'])
        : null;
    cardmarket = json['cardmarket'] != null
        ? Tcgplayer.fromJson(json['cardmarket'])
        : null;
    // evolvesTo = json['evolvesTo'].cast<String>();
    // rules = json['rules'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['supertype'] = supertype;
    data['subtypes'] = subtypes;
    data['level'] = level;
    data['hp'] = hp;
    data['types'] = types;
    data['evolvesFrom'] = evolvesFrom;
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    if (attacks != null) {
      data['attacks'] = attacks!.map((v) => v.toJson()).toList();
    }
    if (weaknesses != null) {
      data['weaknesses'] = weaknesses!.map((v) => v.toJson()).toList();
    }
    if (resistances != null) {
      data['resistances'] = resistances!.map((v) => v.toJson()).toList();
    }
    data['retreatCost'] = retreatCost;
    data['convertedRetreatCost'] = convertedRetreatCost;
    if (set != null) {
      data['set'] = set!.toJson();
    }
    data['number'] = number;
    data['artist'] = artist;
    data['rarity'] = rarity;
    data['flavorText'] = flavorText;
    data['nationalPokedexNumbers'] = nationalPokedexNumbers;
    if (legalities != null) {
      data['legalities'] = legalities!.toJson();
    }
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (tcgplayer != null) {
      data['tcgplayer'] = tcgplayer!.toJson();
    }
    if (cardmarket != null) {
      data['cardmarket'] = cardmarket!.toJson();
    }
    data['evolvesTo'] = evolvesTo;
    data['rules'] = rules;
    return data;
  }
}

class Abilities {
  String? name;
  String? text;
  String? type;

  Abilities({this.name, this.text, this.type});

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['text'] = text;
    data['type'] = type;
    return data;
  }
}

class Attacks {
  String? name;
  List<String>? cost;
  int? convertedEnergyCost;
  String? damage;
  String? text;

  Attacks({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  Attacks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'] != null ? List<String>.from(json['cost']) : null;
    convertedEnergyCost = json['convertedEnergyCost'];
    damage = json['damage'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cost'] = cost;
    data['convertedEnergyCost'] = convertedEnergyCost;
    data['damage'] = damage;
    data['text'] = text;
    return data;
  }
}

class Weaknesses {
  String? type;
  String? value;

  Weaknesses({this.type, this.value});

  Weaknesses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class Set {
  String? id;
  String? name;
  String? series;
  int? printedTotal;
  int? total;
  Legalities? legalities;
  String? ptcgoCode;
  String? releaseDate;
  String? updatedAt;
  Images? images;

  Set({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  Set.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    series = json['series'];
    printedTotal = json['printedTotal'];
    total = json['total'];
    legalities = json['legalities'] != null
        ? Legalities.fromJson(json['legalities'])
        : null;
    ptcgoCode = json['ptcgoCode'];
    releaseDate = json['releaseDate'];
    updatedAt = json['updatedAt'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['series'] = series;
    data['printedTotal'] = printedTotal;
    data['total'] = total;
    if (legalities != null) {
      data['legalities'] = legalities!.toJson();
    }
    data['ptcgoCode'] = ptcgoCode;
    data['releaseDate'] = releaseDate;
    data['updatedAt'] = updatedAt;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    return data;
  }
}

class Legalities {
  String? unlimited;
  String? expanded;

  Legalities({this.unlimited, this.expanded});

  Legalities.fromJson(Map<String, dynamic> json) {
    unlimited = json['unlimited'];
    expanded = json['expanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unlimited'] = unlimited;
    data['expanded'] = expanded;
    return data;
  }
}

class Images {
  String? symbol;
  String? logo;

  Images({this.symbol, this.logo});

  Images.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['logo'] = logo;
    return data;
  }
}

class ImagesModel {
  String? small;
  String? large;

  ImagesModel({this.small, this.large});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class Tcgplayer {
  String? url;
  String? updatedAt;
  PricesTcgplayer? prices;

  Tcgplayer({this.url, this.updatedAt, this.prices});

  Tcgplayer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    updatedAt = json['updatedAt'];
    prices = json['prices'] != null
        ? PricesTcgplayer.fromJson(json['prices'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['updatedAt'] = updatedAt;
    if (prices != null) {
      data['prices'] = prices!.toJson();
    }
    return data;
  }
}

class PricesTcgplayer {
  Holofoil? holofoil;
  Holofoil? reverseHolofoil;
  Normal? normal;

  PricesTcgplayer({this.holofoil, this.reverseHolofoil, this.normal});

  PricesTcgplayer.fromJson(Map<String, dynamic> json) {
    holofoil =
        json['holofoil'] != null ? Holofoil.fromJson(json['holofoil']) : null;
    reverseHolofoil = json['reverseHolofoil'] != null
        ? Holofoil.fromJson(json['reverseHolofoil'])
        : null;
    normal = json['normal'] != null ? Normal.fromJson(json['normal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (holofoil != null) {
      data['holofoil'] = holofoil!.toJson();
    }
    if (reverseHolofoil != null) {
      data['reverseHolofoil'] = reverseHolofoil!.toJson();
    }
    if (normal != null) {
      data['normal'] = normal!.toJson();
    }
    return data;
  }
}

class Holofoil {
  double? low;
  double? mid;
  double? high;
  double? market;
  double? directLow;

  Holofoil({this.low, this.mid, this.high, this.market, this.directLow});

  Holofoil.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = json['high'];
    market = json['market'];
    directLow = json['directLow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low'] = low;
    data['mid'] = mid;
    data['high'] = high;
    data['market'] = market;
    data['directLow'] = directLow;
    return data;
  }
}

class Normal {
  double? low;
  double? mid;
  double? high;
  double? market;

  Normal({this.low, this.mid, this.high, this.market});

  Normal.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = json['high'];
    market = json['market'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['low'] = low;
    data['mid'] = mid;
    data['high'] = high;
    data['market'] = market;
    return data;
  }
}

class Prices {
  double? averageSellPrice;
  double? lowPrice;
  double? trendPrice;
  int? germanProLow;
  int? suggestedPrice;
  double? reverseHoloSell;
  double? reverseHoloLow;
  double? reverseHoloTrend;
  double? lowPriceExPlus;
  double? avg1;
  double? avg7;
  double? avg30;
  double? reverseHoloAvg1;
  double? reverseHoloAvg7;
  double? reverseHoloAvg30;

  Prices({
    this.averageSellPrice,
    this.lowPrice,
    this.trendPrice,
    this.germanProLow,
    this.suggestedPrice,
    this.reverseHoloSell,
    this.reverseHoloLow,
    this.reverseHoloTrend,
    this.lowPriceExPlus,
    this.avg1,
    this.avg7,
    this.avg30,
    this.reverseHoloAvg1,
    this.reverseHoloAvg7,
    this.reverseHoloAvg30,
  });

  Prices.fromJson(Map<String, dynamic> json) {
    averageSellPrice = json['averageSellPrice'];
    lowPrice = json['lowPrice'];
    trendPrice = json['trendPrice'];
    germanProLow = json['germanProLow'];
    suggestedPrice = json['suggestedPrice'];
    reverseHoloSell = json['reverseHoloSell'];
    reverseHoloLow = json['reverseHoloLow'];
    reverseHoloTrend = json['reverseHoloTrend'];
    lowPriceExPlus = json['lowPriceExPlus'];
    avg1 = json['avg1'];
    avg7 = json['avg7'];
    avg30 = json['avg30'];
    reverseHoloAvg1 = json['reverseHoloAvg1'];
    reverseHoloAvg7 = json['reverseHoloAvg7'];
    reverseHoloAvg30 = json['reverseHoloAvg30'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageSellPrice'] = averageSellPrice;
    data['lowPrice'] = lowPrice;
    data['trendPrice'] = trendPrice;
    data['germanProLow'] = germanProLow;
    data['suggestedPrice'] = suggestedPrice;
    data['reverseHoloSell'] = reverseHoloSell;
    data['reverseHoloLow'] = reverseHoloLow;
    data['reverseHoloTrend'] = reverseHoloTrend;
    data['lowPriceExPlus'] = lowPriceExPlus;
    data['avg1'] = avg1;
    data['avg7'] = avg7;
    data['avg30'] = avg30;
    data['reverseHoloAvg1'] = reverseHoloAvg1;
    data['reverseHoloAvg7'] = reverseHoloAvg7;
    data['reverseHoloAvg30'] = reverseHoloAvg30;
    return data;
  }
}
