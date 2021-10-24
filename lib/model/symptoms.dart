enum Symptoms {
  abdominalDiscomfort,
  bradycardia,
  bodyAchesAndPains,
  chill,
  cough,
  drowsiness,
  dizziness,
  headache,
  fever,
  hoarseness,
  highBloodPressure,
  irritability,
  migraine,
  nausea,
  rash,
  shortnessOfBreath,
  rapidPulse,
  lossOfAppetite,
  sleepDisorder,
}

extension SymptomsExt on Symptoms {

  static Symptoms? fromString(String value) {
    switch (value) {
      case 'Symptoms.abdominalDiscomfort':
        return Symptoms.abdominalDiscomfort;
      case 'Symptoms.bradycardia':
        return Symptoms.bradycardia;
      case 'Symptoms.bodyAchesAndPains':
        return Symptoms.bodyAchesAndPains;
      case 'Symptoms.chill':
        return Symptoms.chill;
      case 'Symptoms.cough':
        return Symptoms.cough;
      case 'Symptoms.drowsiness':
        return Symptoms.drowsiness;
      case 'Symptoms.dizziness':
        return Symptoms.dizziness;
      case 'Symptoms.headache':
        return Symptoms.headache;
      case 'Symptoms.fever':
        return Symptoms.fever;
      case 'Symptoms.hoarseness':
        return Symptoms.hoarseness;
      case 'Symptoms.highBloodPressure':
        return Symptoms.highBloodPressure;
      case 'Symptoms.irritability':
        return Symptoms.irritability;
      case 'Symptoms.migraine':
        return Symptoms.migraine;
      case 'Symptoms.nausea':
        return Symptoms.nausea;
      case 'Symptoms.rash':
        return Symptoms.rash;
      case 'Symptoms.shortnessOfBreath':
        return Symptoms.shortnessOfBreath;
      case 'Symptoms.rapidPulse':
        return Symptoms.rapidPulse;
      case 'Symptoms.lossOfAppetite':
        return Symptoms.lossOfAppetite;
      case 'Symptoms.sleepDisorder':
        return Symptoms.sleepDisorder;
    }
  }

  String asString() {
    switch (this) {
      case Symptoms.abdominalDiscomfort:
        return 'Abdominal discomfort';
      case Symptoms.bradycardia:
        return 'Bradycardia';
      case Symptoms.bodyAchesAndPains:
        return 'Body aches and pains';
      case Symptoms.chill:
        return 'Chill';
      case Symptoms.cough:
        return 'Cough';
      case Symptoms.drowsiness:
        return 'Drowsiness';
      case Symptoms.dizziness:
        return 'Dizziness';
      case Symptoms.headache:
        return 'Headache';
      case Symptoms.fever:
        return 'Fever';
      case Symptoms.hoarseness:
        return 'Hoarseness';
      case Symptoms.highBloodPressure:
        return 'High blood pressure';
      case Symptoms.irritability:
        return 'Irritability';
      case Symptoms.migraine:
        return 'Migraine';
      case Symptoms.nausea:
        return 'Nausea';
      case Symptoms.rash:
        return 'Rash';
      case Symptoms.shortnessOfBreath:
        return 'Shortness of breath';
      case Symptoms.rapidPulse:
        return 'Rapid pulse';
      case Symptoms.lossOfAppetite:
        return 'Loss of appetite';
      case Symptoms.sleepDisorder:
        return 'Sleep disorder';
    }
  }
}