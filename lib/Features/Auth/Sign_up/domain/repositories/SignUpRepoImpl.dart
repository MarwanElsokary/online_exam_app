
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../Core/Resources/InternetChecker.dart';
import '../../data/data_sources/SignUpDataSource.dart';
import '../entities/SignUpEntity.dart';
import 'SignUpRepo.dart';

@Injectable(as:SignUpRepo)
class SignUpRepoImpl implements SignUpRepo{
 Signupdatasource signupdatasource;
 @factoryMethod
 SignUpRepoImpl(this.signupdatasource);

  @override
  Future<Either<SignUpEntity, String>> registeruser({
   required String firstname,
   required String secondname,
   required String username,
   required String email,
   required String phone,
   required String pass,
   required String repass}) async{
   bool isconnected=await InternetChecker.CheckNetwork();
   if (isconnected){
var result= await signupdatasource.registeruser(
    firstname: firstname,
    secondname: secondname,
    username: username,
    email: email,
    phone: phone,
    pass: pass,
    repass: repass);
return result.fold((response){
 return left(response.tosignupentity());
}, (error){return Right(error);});
   }
   else{
    return Right("No Internet Connection");
   }

  }
}