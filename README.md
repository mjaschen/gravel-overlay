# Gravel Overlay

## Links / Documentation

- [Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/)
  - [Expressions](https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/)
  - [How to test for nulls with new expression syntax?](https://github.com/mapbox/mapbox-gl-js/issues/5761) → `["!", ["has", field]]`

## Development

- Start Maputnik: `./maputnik`
- Open Maputnik in browser: [http://localhost:8000](http://localhost:8000)
- Upload `style.json` in Maputnik: "Open" → "Upload Style" → `style.json`
- Enter tile server URL in "Data Sources", e.g. `https://tiles.bikerouter.de/services/gravel/`
- switch to *inspect* view: "View" → "Inspect" → move to area where data is available on the tile server (e.g. Europe)
- zoom to at least level 11
- switch to *map* view: "View" → "Map"
- Edit
- Export → Download
- `make style.json` copies downloaded file from `~/Downloads` to `./style.json`

## Testing

Run style validation and tests locally:

```shell
make test
```

This runs:

- MapLibre GL style specification validator (`@maplibre/maplibre-gl-style-spec`)
- Mapbox GL style specification validator (`@mapbox/mapbox-gl-style-spec`)
- Layer ID uniqueness validation

## Deployment

```shell
make install-in-bikerouter
```

Replaces sources URL and stores style in `gravel-style.json`. Copies style to Bikerouter sources.

Deployment via standard Bikerouter deployment process.
