//
//  rotas.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI
import MapKit

struct rotas: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -9.405602091421292, longitude: -40.50435044802576),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.001)))
    @StateObject var viewModel = ViewModel()
    @State var selection = ""
    let walkingRoute: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: -9.411570786205203, longitude: -40.51281764595359),
        CLLocationCoordinate2D(latitude: -9.41120594042784, longitude: -40.51123374346106),
        CLLocationCoordinate2D(latitude: -9.411334091272398,longitude: -40.50607836532993),
        CLLocationCoordinate2D(latitude: -9.411306530989494,longitude: -40.505930247463716),
        CLLocationCoordinate2D(latitude: -9.411426856508646,longitude: -40.50538139494864),
        CLLocationCoordinate2D(latitude:-9.411041814699928,longitude: -40.50525942772307),
        CLLocationCoordinate2D(latitude: -9.411426856508646,longitude: -40.5036494603455),
        CLLocationCoordinate2D(latitude: -9.411835962960463,longitude: -40.50216146019352),
        CLLocationCoordinate2D(latitude: -9.41284669447136,longitude: -40.502588345483026),
        CLLocationCoordinate2D(latitude: -9.413977747657519,longitude: -40.503100607830426),
        CLLocationCoordinate2D(latitude: -9.41384539056102, longitude: -40.50435687025383),
        CLLocationCoordinate2D(latitude: -9.413568643740907,longitude:  -40.505857067128375),
        CLLocationCoordinate2D(latitude: -9.41198035335725, longitude: -40.505857067128375),
        CLLocationCoordinate2D(latitude: -9.408750695454128,longitude: -40.50514965721093),
        CLLocationCoordinate2D(latitude: -9.402773901209049,longitude: -40.50375795012786),
        CLLocationCoordinate2D(latitude: -9.4016490715438, longitude: -40.50359197218374),
        CLLocationCoordinate2D(latitude: -9.400931984938977,longitude: -40.50374912878247),
        CLLocationCoordinate2D(latitude: -9.399296588783242,longitude: -40.5045415300269),
        CLLocationCoordinate2D(latitude: -9.400231821404033, longitude: -40.5041112657918),
        CLLocationCoordinate2D(latitude: -9.399824998459959, longitude: -40.504409871446974),
        CLLocationCoordinate2D(latitude: -9.399530402158927, longitude: -40.504651599726024),
        CLLocationCoordinate2D(latitude: -9.399277890844173, longitude: -40.50459472234989),
        CLLocationCoordinate2D(latitude: -9.398625569095094, longitude: -40.504523625873844),
        CLLocationCoordinate2D(latitude: -9.398274857862155, longitude: -40.50455206439917),
        CLLocationCoordinate2D(latitude: -9.397741776377277, longitude: -40.50464449017606),
        CLLocationCoordinate2D(latitude: -9.39703333762121, longitude: -40.50505685025811),
        CLLocationCoordinate2D(latitude: -9.396675610623824, longitude: -40.505369675338585),
        CLLocationCoordinate2D(latitude: -9.395882998723039, longitude: -40.50620150537812),
        CLLocationCoordinate2D(latitude: -9.395539298886337, longitude: -40.5064076852563),
        CLLocationCoordinate2D(latitude: -9.394557298298821, longitude: -40.5065925364847),
        CLLocationCoordinate2D(latitude: -9.393975110687432, longitude: -40.5069338000906),
        CLLocationCoordinate2D(latitude: -9.392845804638762, longitude: -40.50741725697418),
        CLLocationCoordinate2D(latitude: -9.391765594988842, longitude: -40.50804290680985),
        CLLocationCoordinate2D(latitude: -9.390720454295773, longitude: -40.50841260926666),
        CLLocationCoordinate2D(latitude: -9.389605166226135, longitude: -40.50877520184791),
        CLLocationCoordinate2D(latitude: -9.38830048506026, longitude: -40.50900271070156),
        CLLocationCoordinate2D(latitude: -9.385143977730989, longitude: -40.50987008881637),
        CLLocationCoordinate2D(latitude: -9.384786238456561, longitude: -40.50868277607102),
        CLLocationCoordinate2D(latitude: -9.384540731111818, longitude: -40.50775852025469),
        CLLocationCoordinate2D(latitude: -9.384133889417534, longitude: -40.506386356280935),
        CLLocationCoordinate2D(latitude: -9.382941420473683, longitude: -40.50421080079317),
        CLLocationCoordinate2D(latitude: -9.382646809814647, longitude: -40.50367757640901),
        CLLocationCoordinate2D(latitude: -9.382653824250017, longitude: -40.50330787427769),
        CLLocationCoordinate2D(latitude: -9.383116783735321, longitude: -40.502497373213615),
        CLLocationCoordinate2D(latitude: -9.384267165341496, longitude: -40.50043557215272),
        CLLocationCoordinate2D(latitude: -9.385545966218817, longitude: -40.49806574798146),
            CLLocationCoordinate2D(latitude: -9.385737319915599, longitude: -40.497796720790596),
            CLLocationCoordinate2D(latitude: -9.385786701260635, longitude: -40.497671591724746),
            CLLocationCoordinate2D(latitude: -9.38597188194827, longitude: -40.497727899761436),
            CLLocationCoordinate2D(latitude: -9.386200271515126, longitude: -40.49775292574649),
            CLLocationCoordinate2D(latitude: -9.38656445948386, longitude: -40.497821746489244),
            CLLocationCoordinate2D(latitude: -9.386694085684711, longitude: -40.49791559321696),
            CLLocationCoordinate2D(latitude: -9.386928647352484, longitude: -40.49823467209152),
            CLLocationCoordinate2D(latitude: -9.387194072005354, longitude: -40.49902298460495),
            CLLocationCoordinate2D(latitude: -9.38728666198557, longitude: -40.499423397501154),
            CLLocationCoordinate2D(latitude: -9.38729900740859, longitude: -40.49977375842725),
            CLLocationCoordinate2D(latitude: -9.387459496737508, longitude: -40.50025550505869),
            CLLocationCoordinate2D(latitude: -9.38770023045026, longitude: -40.500699712999),
            CLLocationCoordinate2D(latitude: -9.388194042482654, longitude: -40.50116894663797),
            CLLocationCoordinate2D(latitude: -9.388515020237202, longitude: -40.50133787074803),
            CLLocationCoordinate2D(latitude: -9.38907055762986, longitude: -40.501638180276935),
            CLLocationCoordinate2D(latitude: -9.38927425445069, longitude: -40.50184464307812),
            CLLocationCoordinate2D(latitude: -9.38940387963795, longitude: -40.50196977214397),
            CLLocationCoordinate2D(latitude: -9.389613749074313, longitude: -40.50217623494506),
            CLLocationCoordinate2D(latitude: -9.389891517001216, longitude: -40.50228259437905),
            CLLocationCoordinate2D(latitude: -9.390095213339404, longitude: -40.50243900578294),
            CLLocationCoordinate2D(latitude: -9.390237183255314, longitude: -40.502564134562384),
            CLLocationCoordinate2D(latitude: -9.390366808082318, longitude: -40.50260167325341),
            CLLocationCoordinate2D(latitude: -9.390712474144769, longitude: -40.50227633802596),
            CLLocationCoordinate2D(latitude: -9.390872961892686, longitude: -40.502013567188186),
            CLLocationCoordinate2D(latitude: -9.391064312365415, longitude: -40.50170074466671),
            CLLocationCoordinate2D(latitude: -9.391255662732448, longitude: -40.50143797382883),
            CLLocationCoordinate2D(latitude: -9.390934687799382, longitude: -40.50120648532909),
            CLLocationCoordinate2D(latitude: -9.390508778169496, longitude: -40.50094371449132),
            CLLocationCoordinate2D(latitude: -9.390317427389931, longitude: -40.50081232907238),
            CLLocationCoordinate2D(latitude: -9.390169284705413, longitude: -40.500468224499265),
            CLLocationCoordinate2D(latitude: -9.390237183255314, longitude: -40.49997396487535),
            CLLocationCoordinate2D(latitude: -9.390095213339404, longitude: -40.49927324273665),
            CLLocationCoordinate2D(latitude: -9.389990278782934, longitude: -40.49882277844325),
            CLLocationCoordinate2D(latitude: -9.390039659804508, longitude: -40.498190877047314),
            CLLocationCoordinate2D(latitude: -9.389940897754299, longitude: -40.4976966177098),
            CLLocationCoordinate2D(latitude: -9.389700165598173, longitude: -40.49712728070353),
            CLLocationCoordinate2D(latitude: -9.389471778620392, longitude: -40.49672686809383),
            CLLocationCoordinate2D(latitude: -9.38927425445069, longitude: -40.496420302211845),
            CLLocationCoordinate2D(latitude: -9.389138456677632, longitude: -40.49601988931564),
            CLLocationCoordinate2D(latitude: -9.388897723964005, longitude: -40.495581938014816),
            CLLocationCoordinate2D(latitude: -9.389002658851355, longitude: -40.49524408979469),
            CLLocationCoordinate2D(latitude: -9.38904586719218, longitude: -40.49502511400113),
            CLLocationCoordinate2D(latitude: -9.389286599802897, longitude: -40.49450582896497),
            CLLocationCoordinate2D(latitude: -9.38961374907434, longitude: -40.494074134017026),
            CLLocationCoordinate2D(latitude: -9.390082868016012, longitude: -40.49351731000344),
            CLLocationCoordinate2D(latitude: -9.390181629743179, longitude: -40.4933859245845),
            CLLocationCoordinate2D(latitude: -9.390410016535583, longitude: -40.493229513467014),
            CLLocationCoordinate2D(latitude: -9.390595194752667, longitude: -40.492822844504126),
            CLLocationCoordinate2D(latitude: -9.39103344956628, longitude: -40.49215340441706),
            CLLocationCoordinate2D(latitude: -9.391490221594896, longitude: -40.49174047881488),
            CLLocationCoordinate2D(latitude: -9.391650708699972, longitude: -40.491402630594756),
            CLLocationCoordinate2D(latitude: -9.391977855738995, longitude: -40.49094590994837),
            CLLocationCoordinate2D(latitude: -9.392163033400562, longitude: -40.490683139110494),
            CLLocationCoordinate2D(latitude: -9.392631936834032, longitude: -40.49052018773689),
            CLLocationCoordinate2D(latitude: -9.39272035855765, longitude: -40.49050932434801),
            CLLocationCoordinate2D(latitude: -9.392803421327484, longitude: -40.490093798136854),
            CLLocationCoordinate2D(latitude: -9.39282217752504, longitude: -40.48963210230511),
            CLLocationCoordinate2D(latitude: -9.392869951306167, longitude: -40.489457240955815),
            CLLocationCoordinate2D(latitude: -9.39284341029141, longitude: -40.48935232417033),
            CLLocationCoordinate2D(latitude: -9.393315840729942, longitude: -40.48951911499851),
            CLLocationCoordinate2D(latitude: -9.394550056088601, longitude: -40.48995918733176),
            CLLocationCoordinate2D(latitude: -9.395145209884296, longitude: -40.490260809827326),
            CLLocationCoordinate2D(latitude: -9.396057451642882, longitude: -40.490770106879786),
            CLLocationCoordinate2D(latitude: -9.396506254303922, longitude: -40.49101239401394),
            CLLocationCoordinate2D(latitude: -9.396989204263532, longitude: -40.491363462757164),
            CLLocationCoordinate2D(latitude: -9.39734531837426, longitude: -40.49151674650974),
            CLLocationCoordinate2D(latitude: -9.397535571007984, longitude: -40.49167991937595),
            CLLocationCoordinate2D(latitude: -9.397691675729419, longitude: -40.49179859055146),
            CLLocationCoordinate2D(latitude: -9.397838023772065, longitude: -40.49180353510823),
            CLLocationCoordinate2D(latitude: -9.397872171565375, longitude: -40.491650251582115),
            CLLocationCoordinate2D(latitude: -9.397769727952108, longitude: -40.49158597121113),
            CLLocationCoordinate2D(latitude: -9.397745336760034, longitude: -40.491551358860434),
            CLLocationCoordinate2D(latitude: -9.397579475447056, longitude: -40.491477189375814),
            CLLocationCoordinate2D(latitude: -9.397320927152276, longitude: -40.49136840754039)
    ]
    
    var body: some View {
        ZStack(alignment: .top){
            Map(position: $position)
            {
                MapPolyline(coordinates: walkingRoute)
                    .stroke(.blue, lineWidth: 6)
                Marker("", coordinate: CLLocationCoordinate2D(latitude: -9.411570786205203, longitude: -40.51281764595359))
                
            }
            ZStack(alignment: .center){
                Rectangle().frame(width: 300, height: 70)
                        .cornerRadius(20)
                    .foregroundColor(.mblack)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Picker(" ", selection: $selection) {
                    ForEach(viewModel.chars, id: \.self) { p in
                        Text(p.nome!)
                    }
                }
                    .pickerStyle(.menu)
                    .accentColor(.textcolor)
                }
            .padding(.top)
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}

#Preview {
    rotas()
}
