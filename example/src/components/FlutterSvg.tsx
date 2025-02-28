import * as React from "react"
import Svg, { Defs, LinearGradient, Stop, Path, G } from "react-native-svg"

function FlutterSvgComponent() {
  return (
    <Svg 
    height="50"
    width="50"
    viewBox="0 0 166 202">
      <Defs>
        <LinearGradient id="b">
          <Stop offset={0} stopColor="#c5c5c5" stopOpacity={0.37784091} />
          <Stop offset={1} stopColor="#fff" stopOpacity={0} />
        </LinearGradient>
        <LinearGradient id="a" x1="0%" x2="0%" y1="0%" y2="100%">
          <Stop offset="20%" stopColor="#000" stopOpacity={0.15} />
          <Stop offset="85%" stopColor="#616161" stopOpacity={0.01} />
        </LinearGradient>
      </Defs>
      <Path
        fill="#fff"
        fillOpacity={0.8}
        d="M37.7 128.9L9.8 101l90.6-90.6h55.8M156.2 94h-55.8l-20.9 20.9 27.9 27.9"
      />
      <Path fill="#fff" d="M79.5 170.7l20.9 20.9h55.8l-48.8-48.8" />
      <G transform="rotate(-45.001 79.53 142.782)" fill="#fff">
        <Path fill="#fff" d="M59.8 123.1H99.19999999999999V162.5H59.8z" />
        <Path fill="#fff" d="M59.8 162.5H99.19999999999999V168H59.8z" />
      </G>
      <Path d="M79.5 170.7l41.4-14.3-13.5-13.6" fill="url(#b)" />
    </Svg>
  )
}

export default FlutterSvgComponent

// Svg converted by https://transform.tools/svg-to-react-native
