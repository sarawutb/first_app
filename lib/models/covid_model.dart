class CovidModel{


 String ?newCase;
 String ?totalCase;
 String ?totalDeath;


  CovidModel({
   this.newCase,
   this.totalCase,
   this.totalDeath, 
 });

  factory CovidModel.fromMapJson(Map<String,dynamic> json)=>CovidModel(
    newCase: json["new_case"] == null ?null:json["new_case"].toString(),
    totalCase: json["total_case"] == null ?null:json["total_case"].toString(),
    totalDeath: json["total_death"] == null ?null:json["total_death"].toString(),
  );
}