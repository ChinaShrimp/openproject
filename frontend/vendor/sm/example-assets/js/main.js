var developMode = false;

if (developMode) {
  require.config({
    baseUrl: '../Source',

    paths: {
      Zlib: './Workers/zlib.min'
    },
    shim: {
      Zlib: {
        deps: [],
        exports: 'Zlib'
      }
    }
  });
} else {
  require.config({
    waitSeconds: 600,
    paths: {
      'Cesium': '../../sm/Cesium',
      'Zlib': '../../sm/Workers/zlib.min'
    },
    shim: {
      Cesium: {
        exports: 'Cesium'
      },
      Zlib: {
        exports: 'Zlib'
      }
    }
  });
}

if (typeof Cesium !== "undefined" && typeof Zlib !== "undefined") {
  onload(Cesium, Zlib);
} else if (typeof require === "function") {
  require(["Cesium", "Zlib"], onload);
}
