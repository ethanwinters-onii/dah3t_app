import 'package:discovery_app/models/world.dart';

class Natural extends World {
  Natural({required super.species, required super.entities});

  factory Natural.fromJson(Map<String, dynamic> json) => Natural(
      species: json["data"][0]["specie"]["name"],
      entities: json["data"].map<Entity>((e) => Entity.fromJson(e)).toList());
}

List<Entity> birds = [
  Entity(
      name: "Eagle",
      avatar:
          'https://drive.google.com/uc?export=view&id=1BAkbALKW1n_Fgsqntb690VqA14bG39iX',
      images: [
        'https://drive.google.com/uc?export=view&id=1BAkbALKW1n_Fgsqntb690VqA14bG39iX',
        'https://drive.google.com/uc?export=view&id=1XmXihebROUqwXPZBzhI3E77BGgKf7RT7',
        'https://drive.google.com/uc?export=view&id=1DXkZb7mr82YFkBJNT04CFXtDfzp9-GUD',
        'https://drive.google.com/uc?export=view&id=1VRVVvlVjoR1PEYvYUU_KAW5n47RfXz67',
        'https://drive.google.com/uc?export=view&id=1ogsC6DheVZqURqqQMi4GItY8L07bIAnZ'
      ],
      description:
          "Eagles are large, powerfully-built birds of prey, with heavy heads and beaks. Even the smallest eagles, such as the booted eagle (Aquila pennata), which is comparable in size to a common buzzard (Buteo buteo) or red-tailed hawk (B. jamaicensis), have relatively longer and more evenly broad wings, and more direct, faster flight – despite the reduced size of aerodynamic feathers. Most eagles are larger than any other raptors apart from some vultures. The smallest species of eagle is the South Nicobar serpent eagle (Spilornis klossi), at 450 g (1 lb) and 40 cm (16 in). The largest species are discussed below. Like all birds of prey, eagles have very large hooked beaks for ripping flesh from their prey, strong, muscular legs, and powerful talons.",
      linkWiki: "https://en.wikipedia.org/wiki/Eagle",),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Eagle",
      avatar:
          'https://drive.google.com/uc?export=view&id=1BAkbALKW1n_Fgsqntb690VqA14bG39iX',
      images: [
        'https://drive.google.com/uc?export=view&id=1BAkbALKW1n_Fgsqntb690VqA14bG39iX',
        'https://drive.google.com/uc?export=view&id=1XmXihebROUqwXPZBzhI3E77BGgKf7RT7',
        'https://drive.google.com/uc?export=view&id=1DXkZb7mr82YFkBJNT04CFXtDfzp9-GUD',
        'https://drive.google.com/uc?export=view&id=1VRVVvlVjoR1PEYvYUU_KAW5n47RfXz67',
        'https://drive.google.com/uc?export=view&id=1ogsC6DheVZqURqqQMi4GItY8L07bIAnZ'
      ],
      description:
          "Eagles are large, powerfully-built birds of prey, with heavy heads and beaks. Even the smallest eagles, such as the booted eagle (Aquila pennata), which is comparable in size to a common buzzard (Buteo buteo) or red-tailed hawk (B. jamaicensis), have relatively longer and more evenly broad wings, and more direct, faster flight – despite the reduced size of aerodynamic feathers. Most eagles are larger than any other raptors apart from some vultures. The smallest species of eagle is the South Nicobar serpent eagle (Spilornis klossi), at 450 g (1 lb) and 40 cm (16 in). The largest species are discussed below. Like all birds of prey, eagles have very large hooked beaks for ripping flesh from their prey, strong, muscular legs, and powerful talons.",
      linkWiki: "https://en.wikipedia.org/wiki/Eagle"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
  Entity(
      name: "Parrot",
      avatar:
          'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
      images: [
        'https://drive.google.com/uc?export=view&id=1X-bfeWnN2VlbRutMgL4lZWNb64mgtRKa',
        'https://drive.google.com/uc?export=view&id=1w5G0r6xon8KjASA9147qswNHj7HYbd9F',
        'https://drive.google.com/uc?export=view&id=10CcPrsheGepiXKE62PIvEXN82Kt041OW',
        'https://drive.google.com/uc?export=view&id=11x4qF5bkMQI7DZ_DSJFawK7PH90Jg6CP',
        'https://drive.google.com/uc?export=view&id=1yNmTvK7xyuAVPbJZ0wYKYUUk60G-kOvU'
      ],
      description:
          "Characteristic features of parrots include a strong, curved bill, an upright stance, strong legs, and clawed zygodactyl feet. Many parrots are vividly coloured, and some are multi-coloured. Most parrots exhibit little or no sexual dimorphism in the visual spectrum. They form the most variably sized bird order in terms of length. The most important components of most parrots' diets are seeds, nuts, fruit, buds, and other plant material. A few species sometimes eat animals and carrion, while the lories and lorikeets are specialised for feeding on floral nectar and soft fruits. Almost all parrots nest in tree hollows (or nest boxes in captivity), and lay white eggs from which hatch altricial (helpless) young.",
      linkWiki: "https://en.wikipedia.org/wiki/Parrot"),
];

List<Entity> landingMammals = [
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
  Entity(
      name: "Anteater",
      avatar:
          'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
      images: [
        'https://drive.google.com/uc?export=view&id=10Tmwe47y7om6S2iRJoUjgbSrZwAvz93l',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Anteater is a common name for the four extant mammal species of the suborder Vermilingua (meaning worm tongue) commonly known for eating ants and termites.[2] The individual species have other names in English and other languages. Together with the sloths, they are within the order Pilosa. The name anteater is also commonly applied to the unrelated aardvark, numbat, echidnas, pangolins, and some members of the Oecobiidae, although they are not closely related to them.",
      linkWiki: "https://en.wikipedia.org/wiki/Anteater"),
];

List<Entity> industrialTree = [
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
  Entity(
      name: "Coffee Tree",
      avatar:
          'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
      images: [
        'https://drive.google.com/uc?export=view&id=13nnVy1mEq4zvTeFE27ssFWhz0D8K7NR-',
        'https://drive.google.com/uc?export=view&id=1-IAeCc_njm6cdPz-auWBNJqS1PX3irWg',
        'https://drive.google.com/uc?export=view&id=1-IBPJSLWObvsZ5MmnrJ1x0crIHPaNwH_',
        'https://drive.google.com/uc?export=view&id=1-QKeEkqcahNV03pH_-XWYZfIKnXqZFXK',
        'https://drive.google.com/uc?export=view&id=1-QvfPI1gMz4Z9shWIG5epirx1APP59LB'
      ],
      description:
          "Coffea is a genus of flowering plants in the family Rubiaceae. Coffea species are shrubs or small trees native to tropical and southern Africa and tropical Asia. The seeds of some species, called coffee beans, are used to flavor various beverages and products. The fruits, like the seeds, contain a large amount of caffeine, and have a distinct sweet taste and are often juiced. The plant ranks as one of the world's most valuable and widely traded commodity crops and is an important export product of several countries, including those in Central and South America, the Caribbean and Africa.",
      linkWiki: "https://en.wikipedia.org/wiki/Coffea"),
];

List<Natural> natural = [
  Natural(species: "Landing Mammals", entities: landingMammals),
  Natural(species: "Birds", entities: birds),
  Natural(species: "Insects", entities: birds),
  Natural(species: "Industrial Trees", entities: industrialTree),
  Natural(species: "Agricultural Crops", entities: industrialTree),
  Natural(species: "Flowers", entities: industrialTree),
  Natural(species: "Mushroom", entities: industrialTree),
];
