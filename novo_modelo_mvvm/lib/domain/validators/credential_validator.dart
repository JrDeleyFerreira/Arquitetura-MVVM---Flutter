import 'package:lucid_validation/lucid_validation.dart';
import 'package:novo_modelo_mvvm/domain/dtos/credentials.dart';

class CredentialValidator extends LucidValidator<Credentials> {
  CredentialValidator() {
    ruleFor((c) => c.email, key: 'email').notEmpty().validEmail();

    ruleFor((c) => c.password, key: 'password')
        .notEmpty()
        .minLength(6)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter();
  }
}
