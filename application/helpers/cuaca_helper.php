<?php
/**
 * Cuaca
 * @author Candra Saputra
 * @version 1.0
 */
if (!function_exists('cuaca')) {
    function get_cuaca_icon($cuaca, $keadaan){
        switch ($keadaan) {
            case 'Pagi':
                switch ($cuaca) {
                    case 'Cerah':
                        return 'wi-day-sunny';
                        break;

                    case 'Cerah Berawan':
                        return 'wi-day-sunny-overcast';
                        break;

                    case 'Hujan Petir':
                        return 'wi-day-lightning';
                        break;

                    case 'Hujan Lokal':
                        return 'wi-day-sprinkle';
                        break;

                    case 'Berawan':
                        return 'wi-day-cloudy';
                        break;

                    case 'Halimun':
                        return 'wi-day-fog';
                        break;

                    case 'Berawan Tebal':
                        return 'wi-cloudy';
                        break;

                    case 'Hujan Sedang':
                        return 'wi-day-rain';
                        break;

                    case 'Hujan Ringan':
                        return 'wi-day-showers';
                        break;

                    case 'Hujan Lebat':
                        return 'wi-day-storm-showers';
                        break;

                    case 'Asap':
                        return 'wi-smoke';
                        break;

                    case 'Kabut':
                        return 'wi-day-cloudy-windy';
                        break;

                    case 'Udara Kabur':
                        return 'wi-day-fog';
                        break;

                    default:
                        return 'wi-alien';
                        break;
                }
                
            break;

            case 'Siang':
                switch ($cuaca) {
                    case 'Cerah':
                        return 'wi-day-sunny';
                        break;

                    case 'Cerah Berawan':
                        return 'wi-day-sunny-overcast';
                        break;

                    case 'Hujan Petir':
                        return 'wi-day-lightning';
                        break;

                    case 'Hujan Lokal':
                        return 'wi-day-sprinkle';
                        break;

                    case 'Berawan':
                        return 'wi-day-cloudy';
                        break;

                    case 'Halimun':
                        return 'wi-day-fog';
                        break;

                    case 'Berawan Tebal':
                        return 'wi-cloudy';
                        break;

                    case 'Hujan Sedang':
                        return 'wi-day-rain';
                        break;

                    case 'Hujan Ringan':
                        return 'wi-day-showers';
                        break;

                    case 'Hujan Lebat':
                        return 'wi-day-storm-showers';
                        break;
                    
                    case 'Asap':
                        return 'wi-smoke';
                        break;

                    case 'Kabut':
                        return 'wi-day-cloudy-windy';
                        break;

                    case 'Udara Kabur':
                        return 'wi-day-fog';
                        break;

                    default:
                        return 'wi-alien';
                        break;
                }
                
            break;

            case 'Malam':
                switch ($cuaca) {
                    case 'Cerah':
                        return 'wi-night-clear';
                        break;

                    case 'Cerah Berawan':
                        return 'wi-night-partly-cloudy';
                        break;

                    case 'Hujan Petir':
                        return 'wi-night-alt-lightning';
                        break;

                    case 'Hujan Lokal':
                        return 'wi-night-sprinkle';
                        break;

                    case 'Berawan':
                        return 'wi-night-cloudy';
                        break;

                    case 'Halimun':
                        return 'wi-night-fog';
                        break;

                    case 'Berawan Tebal':
                        return 'wi-cloudy';
                        break;

                    case 'Hujan Sedang':
                        return 'wi-night-rain';
                        break;

                    case 'Hujan Ringan':
                        return 'wi-night-alt-showers';
                        break;

                    case 'Hujan Lebat':
                        return 'wi-night-storm-showers';
                        break;

                    case 'Asap':
                        return 'wi-smoke';
                        break;

                    case 'Kabut':
                        return 'wi-night-cloudy-windy';
                        break;

                    case 'Udara Kabur':
                        return 'wi-night-fog';

                    default:
                        return 'wi-alien';
                        break;
                }

                break;
            
            case 'Dini Hari':
                switch ($cuaca) {
                    case 'Cerah':
                        return 'wi-night-clear';
                        break;

                    case 'Cerah Berawan':
                        return 'wi-night-partly-cloudy';
                        break;

                    case 'Hujan Petir':
                        return 'wi-night-alt-lightning';
                        break;

                    case 'Hujan Lokal':
                        return 'wi-night-sprinkle';
                        break;

                    case 'Berawan':
                        return 'wi-night-cloudy';
                        break;

                    case 'Halimun':
                        return 'wi-night-fog';
                        break;

                    case 'Berawan Tebal':
                        return 'wi-cloudy';
                        break;

                    case 'Hujan Sedang':
                        return 'wi-night-rain';
                        break;

                    case 'Hujan Ringan':
                        return 'wi-night-alt-showers';
                        break;

                    case 'Hujan Lebat':
                        return 'wi-night-storm-showers';
                        break;

                    case 'Asap':
                        return 'wi-smoke';
                        break;
                    
                    case 'Kabut':
                        return 'wi-night-cloudy-windy';
                        break;
                    
                    case 'Udara Kabur':
                        return 'wi-night-fog';
                        break;

                    default:
                        return 'wi-alien';
                        break;
                }

                break;
                
            default:
                # code...
                break;
        }
    }

    function get_angin_icon($angin){
        switch (strtolower($angin)) {
            case 'n':
                return 'wi-from-n';
                break;

            case 'e':
                return 'wi-from-e';
                break;

            case 's':
                return 'wi-from-s';
                break;

            case 'w':
                return 'wi-from-w';
                break;

            case 'nne':
                return 'wi-from-nne';
                break;

            case 'ese':
                return 'wi-from-ese';
                break;

            case 'ssw':
                return 'wi-from-ssw';
                break;

            case 'wnw':
                return 'wi-from-wnw';
                break;
            
            case 'ne':
                return 'wi-from-ne';
                break;

            case 'se':
                return 'wi-from-se';
                break;

            case 'sw':
                return 'wi-from-sw';
                break;

            case 'nw':
                return 'wi-from-nw';
                break;
            
            case 'ene':
                return 'wi-from-ene';
                break;

            case 'sse':
                return 'wi-from-sse';
                break;

            case 'wsw':
                return 'wi-from-wsw';
                break;

            case 'nnw':
                return 'wi-from-nnw';
                break;

            case 'variable':
                return 'wi-refresh';
                break;
            
            default:
                return '';
                break;
        }
    }
}