//
//  Descriptions.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import Foundation

struct Descriptions: Codable {
    let disclaimerEn, disclaimerEs, solDescEn, solDescEs: String
    let terrestrialDateDescEn, terrestrialDateDescEs, tempDescEn, tempDescEs: String
    let pressureDescEn, pressureDescEs, absHumidityDescEn, absHumidityDescEs: String
    let windDescEn, windDescEs, gtsTempDescEn, gtsTempDescEs: String
    let localUvIrradianceIndexDescEn, localUvIrradianceIndexDescEs, atmoOpacityDescEn, atmoOpacityDescEs: String
    let lsDescEn, lsDescEs, seasonDescEn, seasonDescEs: String
    let sunriseSunsetDescEn, sunriseSunsetDescEs: String

    enum CodingKeys: String, CodingKey {
        case disclaimerEn = "disclaimer_en"
        case disclaimerEs = "disclaimer_es"
        case solDescEn = "sol_desc_en"
        case solDescEs = "sol_desc_es"
        case terrestrialDateDescEn = "terrestrial_date_desc_en"
        case terrestrialDateDescEs = "terrestrial_date_desc_es"
        case tempDescEn = "temp_desc_en"
        case tempDescEs = "temp_desc_es"
        case pressureDescEn = "pressure_desc_en"
        case pressureDescEs = "pressure_desc_es"
        case absHumidityDescEn = "abs_humidity_desc_en"
        case absHumidityDescEs = "abs_humidity_desc_es"
        case windDescEn = "wind_desc_en"
        case windDescEs = "wind_desc_es"
        case gtsTempDescEn = "gts_temp_desc_en"
        case gtsTempDescEs = "gts_temp_desc_es"
        case localUvIrradianceIndexDescEn = "local_uv_irradiance_index_desc_en"
        case localUvIrradianceIndexDescEs = "local_uv_irradiance_index_desc_es"
        case atmoOpacityDescEn = "atmo_opacity_desc_en"
        case atmoOpacityDescEs = "atmo_opacity_desc_es"
        case lsDescEn = "ls_desc_en"
        case lsDescEs = "ls_desc_es"
        case seasonDescEn = "season_desc_en"
        case seasonDescEs = "season_desc_es"
        case sunriseSunsetDescEn = "sunrise_sunset_desc_en"
        case sunriseSunsetDescEs = "sunrise_sunset_desc_es"
    }
}