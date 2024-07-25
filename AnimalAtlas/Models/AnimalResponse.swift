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
    public let taxonomy: Taxonomy
    public let locations: [String]
    public let characteristics: Characteristics

    public init(name: String, taxonomy: Taxonomy, locations: [String], characteristics: Characteristics) {
        self.name = name
        self.taxonomy = taxonomy
        self.locations = locations
        self.characteristics = characteristics
    }
}

// MARK: - Characteristics
public struct Characteristics: Codable {
    public let prey, nameOfYoung, groupBehavior, estimatedPopulationSize: String
    public let biggestThreat, mostDistinctiveFeature, otherNameS, gestationPeriod: String
    public let habitat, predators, diet, averageLitterSize: String
    public let lifestyle, commonName, numberOfSpecies, location: String
    public let slogan, group, color, skinType: String
    public let topSpeed, lifespan, weight, height: String
    public let ageOfSexualMaturity, ageOfWeaning: String

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
    }

    public init(prey: String, nameOfYoung: String, groupBehavior: String, estimatedPopulationSize: String, biggestThreat: String, mostDistinctiveFeature: String, otherNameS: String, gestationPeriod: String, habitat: String, predators: String, diet: String, averageLitterSize: String, lifestyle: String, commonName: String, numberOfSpecies: String, location: String, slogan: String, group: String, color: String, skinType: String, topSpeed: String, lifespan: String, weight: String, height: String, ageOfSexualMaturity: String, ageOfWeaning: String) {
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
    }
}

// MARK: - Taxonomy
public struct Taxonomy: Codable {
    public let kingdom, phylum, taxonomyClass, order: String
    public let family, genus, scientificName: String

    public enum CodingKeys: String, CodingKey {
        case kingdom, phylum
        case taxonomyClass = "class"
        case order, family, genus
        case scientificName = "scientific_name"
    }

    public init(kingdom: String, phylum: String, taxonomyClass: String, order: String, family: String, genus: String, scientificName: String) {
        self.kingdom = kingdom
        self.phylum = phylum
        self.taxonomyClass = taxonomyClass
        self.order = order
        self.family = family
        self.genus = genus
        self.scientificName = scientificName
    }
}
