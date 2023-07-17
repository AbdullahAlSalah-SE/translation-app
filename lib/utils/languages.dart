class Translation_languages {
  static final select_languages = <String>['English',
    'Arabic',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Russian',
    'Bengali',
    'Gujarati',
    'Kannada',
    'Malayalam',
    'Punjabi',
    'Tamil',
    'Japanese',
    'Telugu',
    'Hindi',
    'Marathi',
  ];

  static String getLanguageCode(String language) {
    switch (language) {
      case 'Hindi':
        return 'hi';
      case 'Arabic':
        return 'ar';
      case 'Marathi':
        return 'mr';
      case 'Bengali':
        return 'bn';
      case 'Gujarati':
        return 'gu';
      case 'Malayalam':
        return 'ml';
      case 'Kannada':
        return 'kn';
      case 'Punjabi':
        return 'pa';
      case 'Tamil':
        return 'ta';
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Italian':
        return 'it';
      case 'Russian':
        return 'ru';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      case 'Telugu':
        return 'te';
      case 'Japanese':
        return 'ja';
      default:
        return 'en';
    }
  }
}



// class Translation_languages {
//   static final select_languages = <String>['English',
//     'Arabic',
//     'Afar',
//     'Abkhazian',
//     'Afrikaans',
//     'Akan',
//     'Alemannic',
//     'Amharic',
//     'Aragonese',
//     'Angal',
//     'Aramaic',
//     'Assamese',
//     'Asturian',
//     'Avar',
//     'Awadhi',
//     'Aymara',
//     'Azerbaijani',
//     'Bashkir',
//     'Bavarian',
//     'Bikol',
//     'Belarusian',
//     'Belarusian',
//     'Bulgarian',
//     'Bihari',
//     'Bislama',
//     'Bambara',
//     'Bishnupriya Manipuri',
//     'Breton',
//     'Boro',
//     'Bosnian',
//     'Buginese',
//     'Buriat (Russia)',
//     'Bengali',
//     'Catalan',
//     'Chechen',
//     'Cebuano',
//     'Chamorro',
//     'Choctaw',
//     'Cherokee',
//     'Cheyenne',
//     'Corsican',
//     'Cree',
//     'Czech',
//     'Chuvash',
//     'Danish',
//     'Dimli',
//     'Dzongkha',
//     'Ewe',
//     'Esperanto',
//     'Estonian',
//     'Spanish',
//     'French',
//     'German',
//     'Gujarati',
//     'Greek',
//     'Hindi',
//     'Italian',
//     'Japanese',
//     'Kashubian',
//     'Kannada',
//     'Lower Sorbian',
//     'Malayalam',
//     'Min Dong Chinese',
//     'Marathi',
//     'Old Church Slavonic / Old Bulgarian',
//     'Punjabi',
//     'Russian',
//     'Samogitian',
//     'Tamil',
//     'Telugu',
//     'Tibetan',
//     'Welsh',
//   ];
//
//   static String getLanguageCode(String language) {
//     switch (language) {
//       case 'Hindi':
//         return 'hi';
//       case 'Arabic':
//         return 'ar';
//       case 'Marathi':
//         return 'mr';
//       case 'Bengali':
//         return 'bn';
//       case 'Gujarati':
//         return 'gu';
//       case 'Malayalam':
//         return 'ml';
//       case 'Kannada':
//         return 'kn';
//       case 'Punjabi':
//         return 'pa';
//       case 'Tamil':
//         return 'ta';
//       case 'English':
//         return 'en';
//       case 'French':
//         return 'fr';
//       case 'Italian':
//         return 'it';
//       case 'Russian':
//         return 'ru';
//       case 'Spanish':
//         return 'es';
//       case 'German':
//         return 'de';
//       case 'Telugu':
//         return 'te';
//       case 'Japanese':
//         return 'ja';
//       case 'Afar':
//         return 'aa';
//       case 'Abkhazian':
//         return 'ab';
//       case 'Afrikaans':
//         return 'af';
//       case 'Akan':
//         return 'ak';
//       case 'Alemannic':
//         return 'als';
//       case 'Amharic':
//         return 'am';
//       case 'Aragonese':
//         return 'an';
//       case 'Angal':
//         return 'ang';
//       case 'Assamese':
//         return 'as';
//       case 'Aramaic':
//         return 'arc';
//       case 'Assamese':
//         return 'as';
//       case 'Asturian':
//         return 'ast';
//       case 'Avar':
//         return 'av';
//       case 'Awadhi':
//         return 'awa';
//       case 'Aymara':
//         return 'ay';
//       case 'Azerbaijani':
//         return 'az';
//       case 'Bashkir':
//         return 'ba';
//       case 'Bavarian':
//         return 'bar';
//       case 'Samogitian':
//         return 'bat-smg';
//       case 'Bikol':
//         return 'bcl';
//       case 'Belarusian':
//         return 'be';
//       case 'Belarusian':
//         return 'be-x-old';
//       case 'Bulgarian':
//         return 'bg';
//       case 'Bihari':
//         return 'bh';
//       case 'Bislama':
//         return 'bi';
//       case 'Bambara':
//         return 'bm';
//       case 'Tibetan':
//         return 'az';
//       case 'Bishnupriya Manipuri':
//         return 'bpy';
//       case 'Breton':
//         return 'br';
//       case 'Boro':
//         return 'brx';
//       case 'Bosnian':
//         return 'bs';
//       case 'Buginese':
//         return 'bug';
//       case 'Buriat (Russia)':
//         return 'bxr';
//       case 'Catalan':
//         return 'ca';
//       case 'Min Dong Chinese':
//         return 'cdo';
//       case 'Chechen':
//         return 'ce';
//       case 'Cebuano':
//         return 'ceb';
//       case 'Chamorro':
//         return 'ch';
//       case 'Choctaw':
//         return 'cho';
//       case 'Cherokee':
//         return 'chr';
//       case 'Cheyenne':
//         return 'chy';
//       case 'Corsican':
//         return 'co';
//       case 'Cree':
//         return 'cr';
//       case 'Czech':
//         return 'cs';
//       case 'Kashubian':
//         return 'csb';
//       case 'Old Church Slavonic / Old Bulgarian':
//         return 'cu';
//       case 'Chuvash':
//         return 'cv';
//       case 'Welsh':
//         return 'cy';
//       case 'Danish':
//         return 'da';
//       case 'Dimli':
//         return 'diq';
//       case 'Lower Sorbian':
//         return 'dsb';
//       case 'Dzongkha':
//         return 'dz';
//       case 'Ewe':
//         return 'ee';
//       case 'Greek':
//         return 'el';
//       case 'Esperanto':
//         return 'eo';
//       case 'Estonian':
//         return 'et';
//       default:
//         return 'en';
//     }
//   }
// }
