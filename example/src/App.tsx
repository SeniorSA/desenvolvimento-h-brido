// import React from 'react';
// import { StyleSheet, View, Text, Pressable } from 'react-native';
// import { openFlutterSdk } from 'desenvolvimento-hibrido';

// export default function App() {

//   return (
//     <View style={styles.container}>
//       <Pressable style={styles.button} onPress={openFlutterSdk}>
//         <Text style={styles.text}>{'Open Login SDK'}</Text>
//       </Pressable>
//     </View>
//   );
// }

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     justifyContent: 'center',
//   },
//   button: {
//     alignItems: 'center',
//     justifyContent: 'center',
//     paddingVertical: 12,
//     marginHorizontal: 20,
//     borderRadius: 4,
//     elevation: 3,
//     backgroundColor: '#1abc9c',
//   },
//   text: {
//     fontSize: 16,
//     lineHeight: 21,
//     fontWeight: 'bold',
//     letterSpacing: 0.25,
//     color: 'white',
//   },
// });
















import React from 'react';
import {
  Dimensions,
  StatusBar,
  StyleSheet,
  Text,
  View,
  Pressable,
} from 'react-native';
import Svg, { Path } from 'react-native-svg';
import SeniorSvgComponent from './components/SeniorLogoSvg'
import FlutterSvgComponent from './components/FlutterSvg'
import ReactSvgComponent from './components/ReactSvg'
import { openFlutterSdk } from 'desenvolvimento-hibrido';
// import logoSeniorSVG from './assets/logo-senior.svg';

export default function App() {
  StatusBar.setHidden(true);
  return(
    <View style={styles.container}>
      <View style={styles.Box}>
        <View style={styles.background}>
          <Svg
            height={Dimensions.get('screen').height}
            width={Dimensions.get('screen').width}
            viewBox="0 0 450 900"
            // style={styles.top}
          >
            <Path
              fill="#0066FF"
              d='M0 528L25 530.8C50 533.7 100 539.3 150 546.3C200 553.3 250 561.7 300 547.7C350 533.7 400 497.3 425 479.2L450 461L450 901L425 901C400 901 350 901 300 901C250 901 200 901 150 901C100 901 50 901 25 901L0 901Z'
            />
          </Svg>
        </View>

        <View style={[
          styles.Content,
          {
            flexDirection: 'column',
          },
        ]}>

          <View style={styles.Top}>

            {/* Senior Logo */}
            <View style={[styles.Logo,
              {
                flexDirection: 'column',
              }
            ]}>

              <SeniorSvgComponent />
            </View>

            <View style={[styles.Paragraph,
              {
                flexDirection: 'column',
              }
            ]}>

              <View style={styles.PTitle}>
                <Text style={[styles.H1, { color: '#ffffff',
                  // fontWeight: 'bold'
                } ]}>
                  Desenvolvimento Híbrido
                </Text>
              </View>

              <View style={styles.PText}>
                <Text style={styles.P}>Tela construída em React Native.</Text>
                <Text style={styles.P}>Recebe alterações feitas em</Text>
                <Text style={styles.P}>Flutter.</Text>
              </View>

            </View>

            <View style={[styles.TecLogos,
              {
                flexDirection: 'row',
              }
            ]}>

              <View style={styles.TecLogoReact}>
                <ReactSvgComponent />
              </View>

              <View style={styles.TecLogoFlutter}>
                <FlutterSvgComponent />
              </View>

            </View>

          </View>

          <View style={styles.Bottom}>

            <View style={[styles.Paragraph,
              {
                flexDirection: 'column',
              }
            ]}>

              <View style={styles.PTitle}>
                <Text style={[styles.H1, { color: '#ffffff',
                  // fontWeight: 'bold'
                } ]}>
                  Acesse a tela em Flutter
                </Text>
              </View>

              <View style={styles.PText}>
                <Text style={styles.P}>É possível acessar a tela do</Text>
                <Text style={styles.P}>Flutter que está integrada ao</Text>
                <Text style={styles.P}>React Native!</Text>
              </View>

            </View>

              {/* <Button
                title="Press me"
                color="#f194ff"
                onPress={() => Alert.alert('Button with adjusted color pressed')}
              /> */}
              <View style={{marginTop: 30,maxWidth: 340, alignItems: 'center', justifyContent: 'center'}}>
                {/* <Button
                  title="Acessar tela em Flutter"
                  color="#03344d"
                  onPress={() => Alert.alert('Button with adjusted color pressed')}
                /> */}

                <Pressable style={styles.button} onPress={openFlutterSdk}>
                  <Text style={styles.buttonText}>{'Acessar tela Flutter'}</Text>
                </Pressable>

                {/* <TouchableOpacity
                  style={styles.button}
                  onPress={() => Alert.alert('Button with adjusted color pressed')}
                >
                  <Text>Press Here</Text>
                </TouchableOpacity> */}

                {/* <Button
                  titleStyle={{
                    color: '#00BAD4',
                    fontSize: 30,
                    fontStyle: 'italic',
                  }}
                  title="Title"
                  buttonStyle={{
                    backgroundColor: '#FFF',
                    borderRadius: 4,
                    margin: 5,
                  }}
                /> */}
              </View>

          </View>

        </View>


      </View>

      {/* <View style={styles.bottom}> */}
        {/* <View style={styles.box}>
          <Svg
            height={200}
            width={Dimensions.get('screen').width}
            viewBox="0 0 1440 320"
            style={styles.bottomWavy}
          >
            <Path
              fill="#e6c1f6"
              d='M0,64L40,96C80,128,160,192,240,202.7C320,213,400,171,480,149.3C560,128,640,128,720,154.7C800,181,880,235,960,218.7C1040,203,1120,117,1200,74.7C1280,32,1360,32,1400,32L1440,32L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z'
            />
          </Svg>
        </View> */}
      {/* </View> */}
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    // justifyContent: 'center',
    // width: Dimensions.get('screen').width,
    // height: Dimensions.get('screen').height,
  },
  // button: {
  //   alignItems: 'center',
  //   backgroundColor: '#DDDDDD',
  //   padding: 10,
  // },
  button: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 14,
    paddingHorizontal: 80,
    marginHorizontal: 10,
    borderRadius: 10,
    elevation: 3,
    backgroundColor: '#fff',
  },
  buttonText: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
    color: '#0066FF',
  },
  background: {
    // backgroundColor: '#0066FF',
    position: 'absolute',
    bottom: -20,
  },
  Content: {
    // backgroundColor: '#f040e1',
    width: Dimensions.get('screen').width,
    height: Dimensions.get('screen').height,
    // flexDirection: 'column',
    // flexWrap: 'wrap',
  },
  Top: {
    width: Dimensions.get('screen').width,
    height: 500,
    // backgroundColor: '#f040b24d',
  },
  Logo: {
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 80,
    width: Dimensions.get('screen').width,
    // height: 50,
    // width: Dimensions.get('screen').width,
    // height: Dimensions.get('screen').height,
    // backgroundColor: '#f040b266',
  },
  Paragraph: {
    marginTop: 60,
    // backgroundColor: '#f040b266',
    alignItems: 'center',
    justifyContent: 'center',
  },
  PTitle: {
    height: 'auto',
    width: '80%',

    textAlign: 'center',
    alignSelf: 'center',
    justifyContent: 'center',
    alignItems: 'center',
    textAlignVertical: 'center',
    alignContent: 'center',
  },
  PText: {
    height: 'auto',
    width: '80%',

    textAlign: 'center',
    alignSelf: 'center',
    justifyContent: 'center',
    alignItems: 'center',
    textAlignVertical: 'center',
    alignContent: 'center',
  },
  H1: {
    fontWeight: '500',
    fontSize: 22,
    marginBottom: 8,
  },
  P: {
    fontWeight: '300',
    fontSize: 19,
    color: '#ffffff',
  },
  TecLogos: {
    // height: 100,
    // width: '50%',

    marginTop: 80,

    // backgroundColor: '#f040b266',
    alignItems: 'center',
    justifyContent: 'center',
  },
  TecLogoReact: {
    marginRight: 15,
    // backgroundColor: '#46f04066',
  },
  TecLogoFlutter: {
    marginLeft: 15,
    // backgroundColor: '#f0a74066',
  },
  Bottom: {
    width: Dimensions.get('screen').width,
    height: Dimensions.get('screen').height - 500,

    alignItems: 'center',
    justifyContent: 'center',
    // backgroundColor: '#40f0525e',
  },
  // ButtonStyle: {
  //   width: 50,
  //   height: 50,
  //   backgroundColor: '#40f0525e',
  // },
  Box: {
    backgroundColor: '#03344d',
    width: Dimensions.get('screen').width,
    height: Dimensions.get('screen').height,
  },
})
