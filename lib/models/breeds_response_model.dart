// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BreedsResponseModel {
  Message? message;
  String? status;

  BreedsResponseModel({this.message, this.status});

  BreedsResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? Message.fromMap(json['message']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toMap();
    }
    data['status'] = status;
    return data;
  }
}

class Message {
  List<String>? affenpinscher;
  List<String>? african;
  List<String>? airedale;
  List<String>? akita;
  List<String>? appenzeller;
  List<String>? australian;
  List<String>? basenji;
  List<String>? beagle;
  List<String>? bluetick;
  List<String>? borzoi;
  List<String>? bouvier;
  List<String>? boxer;
  List<String>? brabancon;
  List<String>? briard;
  List<String>? buhund;
  List<String>? bulldog;
  List<String>? bullterrier;
  List<String>? cattledog;
  List<String>? cavapoo;
  List<String>? chihuahua;
  List<String>? chow;
  List<String>? clumber;
  List<String>? cockapoo;
  List<String>? collie;
  List<String>? coonhound;
  List<String>? corgi;
  List<String>? cotondetulear;
  List<String>? dachshund;
  List<String>? dalmatian;
  List<String>? dane;
  List<String>? deerhound;
  List<String>? dhole;
  List<String>? dingo;
  List<String>? doberman;
  List<String>? elkhound;
  List<String>? entlebucher;
  List<String>? eskimo;
  List<String>? finnish;
  List<String>? frise;
  List<String>? germanshepherd;
  List<String>? greyhound;
  List<String>? groenendael;
  List<String>? havanese;
  List<String>? hound;
  List<String>? husky;
  List<String>? keeshond;
  List<String>? kelpie;
  List<String>? komondor;
  List<String>? kuvasz;
  List<String>? labradoodle;
  List<String>? labrador;
  List<String>? leonberg;
  List<String>? lhasa;
  List<String>? malamute;
  List<String>? malinois;
  List<String>? maltese;
  List<String>? mastiff;
  List<String>? mexicanhairless;
  List<String>? mix;
  List<String>? mountain;
  List<String>? newfoundland;
  List<String>? otterhound;
  List<String>? ovcharka;
  List<String>? papillon;
  List<String>? pekinese;
  List<String>? pembroke;
  List<String>? pinscher;
  List<String>? pitbull;
  List<String>? pointer;
  List<String>? pomeranian;
  List<String>? poodle;
  List<String>? pug;
  List<String>? puggle;
  List<String>? pyrenees;
  List<String>? redbone;
  List<String>? retriever;
  List<String>? ridgeback;
  List<String>? rottweiler;
  List<String>? saluki;
  List<String>? samoyed;
  List<String>? schipperke;
  List<String>? schnauzer;
  List<String>? segugio;
  List<String>? setter;
  List<String>? sharpei;
  List<String>? sheepdog;
  List<String>? shiba;
  List<String>? shihtzu;
  List<String>? spaniel;
  List<String>? spitz;
  List<String>? springer;
  List<String>? stbernard;
  List<String>? terrier;
  List<String>? tervuren;
  List<String>? vizsla;
  List<String>? waterdog;
  List<String>? weimaraner;
  List<String>? whippet;
  List<String>? wolfhound;

  Message(
      this.affenpinscher,
      this.african,
      this.airedale,
      this.akita,
      this.appenzeller,
      this.australian,
      this.basenji,
      this.beagle,
      this.bluetick,
      this.borzoi,
      this.bouvier,
      this.boxer,
      this.brabancon,
      this.briard,
      this.buhund,
      this.bulldog,
      this.bullterrier,
      this.cattledog,
      this.cavapoo,
      this.chihuahua,
      this.chow,
      this.clumber,
      this.cockapoo,
      this.collie,
      this.coonhound,
      this.corgi,
      this.cotondetulear,
      this.dachshund,
      this.dalmatian,
      this.dane,
      this.deerhound,
      this.dhole,
      this.dingo,
      this.doberman,
      this.elkhound,
      this.entlebucher,
      this.eskimo,
      this.finnish,
      this.frise,
      this.germanshepherd,
      this.greyhound,
      this.groenendael,
      this.havanese,
      this.hound,
      this.husky,
      this.keeshond,
      this.kelpie,
      this.komondor,
      this.kuvasz,
      this.labradoodle,
      this.labrador,
      this.leonberg,
      this.lhasa,
      this.malamute,
      this.malinois,
      this.maltese,
      this.mastiff,
      this.mexicanhairless,
      this.mix,
      this.mountain,
      this.newfoundland,
      this.otterhound,
      this.ovcharka,
      this.papillon,
      this.pekinese,
      this.pembroke,
      this.pinscher,
      this.pitbull,
      this.pointer,
      this.pomeranian,
      this.poodle,
      this.pug,
      this.puggle,
      this.pyrenees,
      this.redbone,
      this.retriever,
      this.ridgeback,
      this.rottweiler,
      this.saluki,
      this.samoyed,
      this.schipperke,
      this.schnauzer,
      this.segugio,
      this.setter,
      this.sharpei,
      this.sheepdog,
      this.shiba,
      this.shihtzu,
      this.spaniel,
      this.spitz,
      this.springer,
      this.stbernard,
      this.terrier,
      this.tervuren,
      this.vizsla,
      this.waterdog,
      this.weimaraner,
      this.whippet,
      this.wolfhound);

  Message copyWith({
    List<String>? affenpinscher,
    List<String>? african,
    List<String>? airedale,
    List<String>? akita,
    List<String>? appenzeller,
    List<String>? australian,
    List<String>? basenji,
    List<String>? beagle,
    List<String>? bluetick,
    List<String>? borzoi,
    List<String>? bouvier,
    List<String>? boxer,
    List<String>? brabancon,
    List<String>? briard,
    List<String>? buhund,
    List<String>? bulldog,
    List<String>? bullterrier,
    List<String>? cattledog,
    List<String>? cavapoo,
    List<String>? chihuahua,
    List<String>? chow,
    List<String>? clumber,
    List<String>? cockapoo,
    List<String>? collie,
    List<String>? coonhound,
    List<String>? corgi,
    List<String>? cotondetulear,
    List<String>? dachshund,
    List<String>? dalmatian,
    List<String>? dane,
    List<String>? deerhound,
    List<String>? dhole,
    List<String>? dingo,
    List<String>? doberman,
    List<String>? elkhound,
    List<String>? entlebucher,
    List<String>? eskimo,
    List<String>? finnish,
    List<String>? frise,
    List<String>? germanshepherd,
    List<String>? greyhound,
    List<String>? groenendael,
    List<String>? havanese,
    List<String>? hound,
    List<String>? husky,
    List<String>? keeshond,
    List<String>? kelpie,
    List<String>? komondor,
    List<String>? kuvasz,
    List<String>? labradoodle,
    List<String>? labrador,
    List<String>? leonberg,
    List<String>? lhasa,
    List<String>? malamute,
    List<String>? malinois,
    List<String>? maltese,
    List<String>? mastiff,
    List<String>? mexicanhairless,
    List<String>? mix,
    List<String>? mountain,
    List<String>? newfoundland,
    List<String>? otterhound,
    List<String>? ovcharka,
    List<String>? papillon,
    List<String>? pekinese,
    List<String>? pembroke,
    List<String>? pinscher,
    List<String>? pitbull,
    List<String>? pointer,
    List<String>? pomeranian,
    List<String>? poodle,
    List<String>? pug,
    List<String>? puggle,
    List<String>? pyrenees,
    List<String>? redbone,
    List<String>? retriever,
    List<String>? ridgeback,
    List<String>? rottweiler,
    List<String>? saluki,
    List<String>? samoyed,
    List<String>? schipperke,
    List<String>? schnauzer,
    List<String>? segugio,
    List<String>? setter,
    List<String>? sharpei,
    List<String>? sheepdog,
    List<String>? shiba,
    List<String>? shihtzu,
    List<String>? spaniel,
    List<String>? spitz,
    List<String>? springer,
    List<String>? stbernard,
    List<String>? terrier,
    List<String>? tervuren,
    List<String>? vizsla,
    List<String>? waterdog,
    List<String>? weimaraner,
    List<String>? whippet,
    List<String>? wolfhound,
  }) {
    return Message(
      affenpinscher ?? this.affenpinscher,
      african ?? this.african,
      airedale ?? this.airedale,
      akita ?? this.akita,
      appenzeller ?? this.appenzeller,
      australian ?? this.australian,
      basenji ?? this.basenji,
      beagle ?? this.beagle,
      bluetick ?? this.bluetick,
      borzoi ?? this.borzoi,
      bouvier ?? this.bouvier,
      boxer ?? this.boxer,
      brabancon ?? this.brabancon,
      briard ?? this.briard,
      buhund ?? this.buhund,
      bulldog ?? this.bulldog,
      bullterrier ?? this.bullterrier,
      cattledog ?? this.cattledog,
      cavapoo ?? this.cavapoo,
      chihuahua ?? this.chihuahua,
      chow ?? this.chow,
      clumber ?? this.clumber,
      cockapoo ?? this.cockapoo,
      collie ?? this.collie,
      coonhound ?? this.coonhound,
      corgi ?? this.corgi,
      cotondetulear ?? this.cotondetulear,
      dachshund ?? this.dachshund,
      dalmatian ?? this.dalmatian,
      dane ?? this.dane,
      deerhound ?? this.deerhound,
      dhole ?? this.dhole,
      dingo ?? this.dingo,
      doberman ?? this.doberman,
      elkhound ?? this.elkhound,
      entlebucher ?? this.entlebucher,
      eskimo ?? this.eskimo,
      finnish ?? this.finnish,
      frise ?? this.frise,
      germanshepherd ?? this.germanshepherd,
      greyhound ?? this.greyhound,
      groenendael ?? this.groenendael,
      havanese ?? this.havanese,
      hound ?? this.hound,
      husky ?? this.husky,
      keeshond ?? this.keeshond,
      kelpie ?? this.kelpie,
      komondor ?? this.komondor,
      kuvasz ?? this.kuvasz,
      labradoodle ?? this.labradoodle,
      labrador ?? this.labrador,
      leonberg ?? this.leonberg,
      lhasa ?? this.lhasa,
      malamute ?? this.malamute,
      malinois ?? this.malinois,
      maltese ?? this.maltese,
      mastiff ?? this.mastiff,
      mexicanhairless ?? this.mexicanhairless,
      mix ?? this.mix,
      mountain ?? this.mountain,
      newfoundland ?? this.newfoundland,
      otterhound ?? this.otterhound,
      ovcharka ?? this.ovcharka,
      papillon ?? this.papillon,
      pekinese ?? this.pekinese,
      pembroke ?? this.pembroke,
      pinscher ?? this.pinscher,
      pitbull ?? this.pitbull,
      pointer ?? this.pointer,
      pomeranian ?? this.pomeranian,
      poodle ?? this.poodle,
      pug ?? this.pug,
      puggle ?? this.puggle,
      pyrenees ?? this.pyrenees,
      redbone ?? this.redbone,
      retriever ?? this.retriever,
      ridgeback ?? this.ridgeback,
      rottweiler ?? this.rottweiler,
      saluki ?? this.saluki,
      samoyed ?? this.samoyed,
      schipperke ?? this.schipperke,
      schnauzer ?? this.schnauzer,
      segugio ?? this.segugio,
      setter ?? this.setter,
      sharpei ?? this.sharpei,
      sheepdog ?? this.sheepdog,
      shiba ?? this.shiba,
      shihtzu ?? this.shihtzu,
      spaniel ?? this.spaniel,
      spitz ?? this.spitz,
      springer ?? this.springer,
      stbernard ?? this.stbernard,
      terrier ?? this.terrier,
      tervuren ?? this.tervuren,
      vizsla ?? this.vizsla,
      waterdog ?? this.waterdog,
      weimaraner ?? this.weimaraner,
      whippet ?? this.whippet,
      wolfhound ?? this.wolfhound,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'affenpinscher': affenpinscher,
      'african': african,
      'airedale': airedale,
      'akita': akita,
      'appenzeller': appenzeller,
      'australian': australian,
      'basenji': basenji,
      'beagle': beagle,
      'bluetick': bluetick,
      'borzoi': borzoi,
      'bouvier': bouvier,
      'boxer': boxer,
      'brabancon': brabancon,
      'briard': briard,
      'buhund': buhund,
      'bulldog': bulldog,
      'bullterrier': bullterrier,
      'cattledog': cattledog,
      'cavapoo': cavapoo,
      'chihuahua': chihuahua,
      'chow': chow,
      'clumber': clumber,
      'cockapoo': cockapoo,
      'collie': collie,
      'coonhound': coonhound,
      'corgi': corgi,
      'cotondetulear': cotondetulear,
      'dachshund': dachshund,
      'dalmatian': dalmatian,
      'dane': dane,
      'deerhound': deerhound,
      'dhole': dhole,
      'dingo': dingo,
      'doberman': doberman,
      'elkhound': elkhound,
      'entlebucher': entlebucher,
      'eskimo': eskimo,
      'finnish': finnish,
      'frise': frise,
      'germanshepherd': germanshepherd,
      'greyhound': greyhound,
      'groenendael': groenendael,
      'havanese': havanese,
      'hound': hound,
      'husky': husky,
      'keeshond': keeshond,
      'kelpie': kelpie,
      'komondor': komondor,
      'kuvasz': kuvasz,
      'labradoodle': labradoodle,
      'labrador': labrador,
      'leonberg': leonberg,
      'lhasa': lhasa,
      'malamute': malamute,
      'malinois': malinois,
      'maltese': maltese,
      'mastiff': mastiff,
      'mexicanhairless': mexicanhairless,
      'mix': mix,
      'mountain': mountain,
      'newfoundland': newfoundland,
      'otterhound': otterhound,
      'ovcharka': ovcharka,
      'papillon': papillon,
      'pekinese': pekinese,
      'pembroke': pembroke,
      'pinscher': pinscher,
      'pitbull': pitbull,
      'pointer': pointer,
      'pomeranian': pomeranian,
      'poodle': poodle,
      'pug': pug,
      'puggle': puggle,
      'pyrenees': pyrenees,
      'redbone': redbone,
      'retriever': retriever,
      'ridgeback': ridgeback,
      'rottweiler': rottweiler,
      'saluki': saluki,
      'samoyed': samoyed,
      'schipperke': schipperke,
      'schnauzer': schnauzer,
      'segugio': segugio,
      'setter': setter,
      'sharpei': sharpei,
      'sheepdog': sheepdog,
      'shiba': shiba,
      'shihtzu': shihtzu,
      'spaniel': spaniel,
      'spitz': spitz,
      'springer': springer,
      'stbernard': stbernard,
      'terrier': terrier,
      'tervuren': tervuren,
      'vizsla': vizsla,
      'waterdog': waterdog,
      'weimaraner': weimaraner,
      'whippet': whippet,
      'wolfhound': wolfhound,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      map['affenpinscher'] != null ? List<String>.from(map['affenpinscher']) : null,
      map['african'] != null ? List<String>.from(map['african']) : null,
      map['airedale'] != null ? List<String>.from(map['airedale']) : null,
      map['akita'] != null ? List<String>.from(map['akita']) : null,
      map['appenzeller'] != null ? List<String>.from(map['appenzeller']) : null,
      map['australian'] != null ? List<String>.from(map['australian']) : null,
      map['basenji'] != null ? List<String>.from(map['basenji']) : null,
      map['beagle'] != null ? List<String>.from(map['beagle']) : null,
      map['bluetick'] != null ? List<String>.from(map['bluetick']) : null,
      map['borzoi'] != null ? List<String>.from(map['borzoi']) : null,
      map['bouvier'] != null ? List<String>.from(map['bouvier']) : null,
      map['boxer'] != null ? List<String>.from(map['boxer']) : null,
      map['brabancon'] != null ? List<String>.from(map['brabancon']) : null,
      map['briard'] != null ? List<String>.from(map['briard']) : null,
      map['buhund'] != null ? List<String>.from(map['buhund']) : null,
      map['bulldog'] != null ? List<String>.from(map['bulldog']) : null,
      map['bullterrier'] != null ? List<String>.from(map['bullterrier']) : null,
      map['cattledog'] != null ? List<String>.from(map['cattledog']) : null,
      map['cavapoo'] != null ? List<String>.from(map['cavapoo']) : null,
      map['chihuahua'] != null ? List<String>.from(map['chihuahua']) : null,
      map['chow'] != null ? List<String>.from(map['chow']) : null,
      map['clumber'] != null ? List<String>.from(map['clumber']) : null,
      map['cockapoo'] != null ? List<String>.from(map['cockapoo']) : null,
      map['collie'] != null ? List<String>.from(map['collie']) : null,
      map['coonhound'] != null ? List<String>.from(map['coonhound']) : null,
      map['corgi'] != null ? List<String>.from(map['corgi']) : null,
      map['cotondetulear'] != null ? List<String>.from(map['cotondetulear']) : null,
      map['dachshund'] != null ? List<String>.from(map['dachshund']) : null,
      map['dalmatian'] != null ? List<String>.from(map['dalmatian']) : null,
      map['dane'] != null ? List<String>.from(map['dane']) : null,
      map['deerhound'] != null ? List<String>.from(map['deerhound']) : null,
      map['dhole'] != null ? List<String>.from(map['dhole']) : null,
      map['dingo'] != null ? List<String>.from(map['dingo']) : null,
      map['doberman'] != null ? List<String>.from(map['doberman']) : null,
      map['elkhound'] != null ? List<String>.from(map['elkhound']) : null,
      map['entlebucher'] != null ? List<String>.from(map['entlebucher']) : null,
      map['eskimo'] != null ? List<String>.from(map['eskimo']) : null,
      map['finnish'] != null ? List<String>.from(map['finnish']) : null,
      map['frise'] != null ? List<String>.from(map['frise']) : null,
      map['germanshepherd'] != null ? List<String>.from(map['germanshepherd']) : null,
      map['greyhound'] != null ? List<String>.from(map['greyhound']) : null,
      map['groenendael'] != null ? List<String>.from(map['groenendael']) : null,
      map['havanese'] != null ? List<String>.from(map['havanese']) : null,
      map['hound'] != null ? List<String>.from(map['hound']) : null,
      map['husky'] != null ? List<String>.from(map['husky']) : null,
      map['keeshond'] != null ? List<String>.from(map['keeshond']) : null,
      map['kelpie'] != null ? List<String>.from(map['kelpie']) : null,
      map['komondor'] != null ? List<String>.from(map['komondor']) : null,
      map['kuvasz'] != null ? List<String>.from(map['kuvasz']) : null,
      map['labradoodle'] != null ? List<String>.from(map['labradoodle']) : null,
      map['labrador'] != null ? List<String>.from(map['labrador']) : null,
      map['leonberg'] != null ? List<String>.from(map['leonberg']) : null,
      map['lhasa'] != null ? List<String>.from(map['lhasa']) : null,
      map['malamute'] != null ? List<String>.from(map['malamute']) : null,
      map['malinois'] != null ? List<String>.from(map['malinois']) : null,
      map['maltese'] != null ? List<String>.from(map['maltese']) : null,
      map['mastiff'] != null ? List<String>.from(map['mastiff']) : null,
      map['mexicanhairless'] != null ? List<String>.from(map['mexicanhairless']) : null,
      map['mix'] != null ? List<String>.from(map['mix']) : null,
      map['mountain'] != null ? List<String>.from(map['mountain']) : null,
      map['newfoundland'] != null ? List<String>.from(map['newfoundland']) : null,
      map['otterhound'] != null ? List<String>.from(map['otterhound']) : null,
      map['ovcharka'] != null ? List<String>.from(map['ovcharka']) : null,
      map['papillon'] != null ? List<String>.from(map['papillon']) : null,
      map['pekinese'] != null ? List<String>.from(map['pekinese']) : null,
      map['pembroke'] != null ? List<String>.from(map['pembroke']) : null,
      map['pinscher'] != null ? List<String>.from(map['pinscher']) : null,
      map['pitbull'] != null ? List<String>.from(map['pitbull']) : null,
      map['pointer'] != null ? List<String>.from(map['pointer']) : null,
      map['pomeranian'] != null ? List<String>.from(map['pomeranian']) : null,
      map['poodle'] != null ? List<String>.from(map['poodle']) : null,
      map['pug'] != null ? List<String>.from(map['pug']) : null,
      map['puggle'] != null ? List<String>.from(map['puggle']) : null,
      map['pyrenees'] != null ? List<String>.from(map['pyrenees']) : null,
      map['redbone'] != null ? List<String>.from(map['redbone']) : null,
      map['retriever'] != null ? List<String>.from(map['retriever']) : null,
      map['ridgeback'] != null ? List<String>.from(map['ridgeback']) : null,
      map['rottweiler'] != null ? List<String>.from(map['rottweiler']) : null,
      map['saluki'] != null ? List<String>.from(map['saluki']) : null,
      map['samoyed'] != null ? List<String>.from(map['samoyed']) : null,
      map['schipperke'] != null ? List<String>.from(map['schipperke']) : null,
      map['schnauzer'] != null ? List<String>.from(map['schnauzer']) : null,
      map['segugio'] != null ? List<String>.from(map['segugio']) : null,
      map['setter'] != null ? List<String>.from(map['setter']) : null,
      map['sharpei'] != null ? List<String>.from(map['sharpei']) : null,
      map['sheepdog'] != null ? List<String>.from(map['sheepdog']) : null,
      map['shiba'] != null ? List<String>.from(map['shiba']) : null,
      map['shihtzu'] != null ? List<String>.from(map['shihtzu']) : null,
      map['spaniel'] != null ? List<String>.from(map['spaniel']) : null,
      map['spitz'] != null ? List<String>.from(map['spitz']) : null,
      map['springer'] != null ? List<String>.from(map['springer']) : null,
      map['stbernard'] != null ? List<String>.from(map['stbernard']) : null,
      map['terrier'] != null ? List<String>.from(map['terrier']) : null,
      map['tervuren'] != null ? List<String>.from(map['tervuren']) : null,
      map['vizsla'] != null ? List<String>.from(map['vizsla']) : null,
      map['waterdog'] != null ? List<String>.from(map['waterdog']) : null,
      map['weimaraner'] != null ? List<String>.from(map['weimaraner']) : null,
      map['whippet'] != null ? List<String>.from(map['whippet']) : null,
      map['wolfhound'] != null ? List<String>.from(map['wolfhound']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
