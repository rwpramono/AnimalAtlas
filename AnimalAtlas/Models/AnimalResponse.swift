//
//  AnimalResponse.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public typealias AnimalResponse = [AnimalResponseElement]

// MARK: - AnimalResponseElement
public struct AnimalResponseElement: Codable {
    public let name: String
    public let taxonomy: AnimalAnimalLocation
    public let locations: [Location]
    public let characteristics: AnimalCharacteristics

    public init(name: String, taxonomy: AnimalAnimalLocation, locations: [Location], characteristics: AnimalCharacteristics) {
        self.name = name
        self.taxonomy = taxonomy
        self.locations = locations
        self.characteristics = characteristics
    }
}

// MARK: - AnimalCharacteristics
public struct AnimalCharacteristics: Codable {
    public let prey, nameOfYoung: String?
    public let groupBehavior: GroupBehavior?
    public let estimatedPopulationSize, biggestThreat, mostDistinctiveFeature, otherNameS: String?
    public let gestationPeriod: String?
    public let habitat: String
    public let predators: String?
    public let diet: Diet
    public let averageLitterSize: String
    public let lifestyle: GroupBehavior
    public let commonName, numberOfSpecies, location: String?
    public let slogan: String
    public let group: String?
    public let color: String
    public let skinType: SkinType
    public let topSpeed, lifespan, weight: String
    public let height, ageOfSexualMaturity, ageOfWeaning, mainPrey: String?
    public let distinctiveFeature, favoriteFood, type, length: String?

    public enum CodingKeys: String, CodingKey {
        case prey
        case nameOfYoung = "name_of_young"
        case groupBehavior = "group_behavior"
        case estimatedPopulationSize = "estimated_population_size"
        case biggestThreat = "biggest_threat"
        case mostDistinctiveFeature = "most_distinctive_feature"
        case otherNameS = "other_name(s)"
        case gestationPeriod = "gestation_period"
        case habitat, predators, diet
        case averageLitterSize = "average_litter_size"
        case lifestyle
        case commonName = "common_name"
        case numberOfSpecies = "number_of_species"
        case location, slogan, group, color
        case skinType = "skin_type"
        case topSpeed = "top_speed"
        case lifespan, weight, height
        case ageOfSexualMaturity = "age_of_sexual_maturity"
        case ageOfWeaning = "age_of_weaning"
        case mainPrey = "main_prey"
        case distinctiveFeature = "distinctive_feature"
        case favoriteFood = "favorite_food"
        case type, length
    }

    public init(prey: String?, nameOfYoung: String?, groupBehavior: GroupBehavior?, estimatedPopulationSize: String?, biggestThreat: String?, mostDistinctiveFeature: String?, otherNameS: String?, gestationPeriod: String?, habitat: String, predators: String?, diet: Diet, averageLitterSize: String, lifestyle: GroupBehavior, commonName: String?, numberOfSpecies: String?, location: String?, slogan: String, group: String?, color: String, skinType: SkinType, topSpeed: String, lifespan: String, weight: String, height: String?, ageOfSexualMaturity: String?, ageOfWeaning: String?, mainPrey: String?, distinctiveFeature: String?, favoriteFood: String?, type: String?, length: String?) {
        self.prey = prey
        self.nameOfYoung = nameOfYoung
        self.groupBehavior = groupBehavior
        self.estimatedPopulationSize = estimatedPopulationSize
        self.biggestThreat = biggestThreat
        self.mostDistinctiveFeature = mostDistinctiveFeature
        self.otherNameS = otherNameS
        self.gestationPeriod = gestationPeriod
        self.habitat = habitat
        self.predators = predators
        self.diet = diet
        self.averageLitterSize = averageLitterSize
        self.lifestyle = lifestyle
        self.commonName = commonName
        self.numberOfSpecies = numberOfSpecies
        self.location = location
        self.slogan = slogan
        self.group = group
        self.color = color
        self.skinType = skinType
        self.topSpeed = topSpeed
        self.lifespan = lifespan
        self.weight = weight
        self.height = height
        self.ageOfSexualMaturity = ageOfSexualMaturity
        self.ageOfWeaning = ageOfWeaning
        self.mainPrey = mainPrey
        self.distinctiveFeature = distinctiveFeature
        self.favoriteFood = favoriteFood
        self.type = type
        self.length = length
    }
}

public enum Diet: String, Codable {
    case carnivore = "Carnivore"
    case herbivore = "Herbivore"
    case omnivore = "Omnivore"
}

public enum GroupBehavior: String, Codable {
    case diurnal = "Diurnal"
    case herd = "Herd"
    case solitary = "Solitary"
}

public enum SkinType: String, Codable {
    case fur = "Fur"
    case leather = "Leather"
}

public enum Location: String, Codable {
    case africa = "Africa"
    case asia = "Asia"
    case ocean = "Ocean"
}

// MARK: - AnimalAnimalLocation
public struct AnimalAnimalLocation: Codable {
    public let kingdom: AnimalKingdom
    public let phylum: AnimalPhylum
    public let taxonomyAnimalClass: AnimalClass
    public let order: AnimalOrder
    public let family: AnimalFamily
    public let genus, scientificName: String?

    public enum CodingKeys: String, CodingKey {
        case kingdom, phylum
        case taxonomyAnimalClass = "class"
        case order, family, genus
        case scientificName = "scientific_name"
    }

    public init(kingdom: AnimalKingdom, phylum: AnimalPhylum, taxonomyAnimalClass: AnimalClass, order: AnimalOrder, family: AnimalFamily, genus: String?, scientificName: String?) {
        self.kingdom = kingdom
        self.phylum = phylum
        self.taxonomyAnimalClass = taxonomyAnimalClass
        self.order = order
        self.family = family
        self.genus = genus
        self.scientificName = scientificName
    }
}

public enum AnimalFamily: String, Codable {
    case elephantidae = "Elephantidae"
    case macroscelididae = "Macroscelididae"
    case phocidae = "Phocidae"
}

public enum AnimalKingdom: String, Codable {
    case animalia = "Animalia"
}

public enum AnimalOrder: String, Codable {
    case carnivora = "Carnivora"
    case macroscelidea = "Macroscelidea"
    case proboscidea = "Proboscidea"
}

public enum AnimalPhylum: String, Codable {
    case chordata = "Chordata"
}

public enum AnimalClass: String, Codable {
    case mammalia = "Mammalia"
}
