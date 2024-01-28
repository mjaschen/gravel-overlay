# Gravel Overlay

## Links / Documentation

- [Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/)
  - [Expressions](https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/)
  - [How to test for nulls with new expression syntax?](https://github.com/mapbox/mapbox-gl-js/issues/5761) → `["!", ["has", field]]`

## Development

- Upload `style.json` in Maputnik
- Edit
- Export → Download
- `make style.json` copies downloaded file from `~/Downloads` to `./style.json`

## Deployment

```shell
make install-in-bikerouter
```

Replaces sources URL and stores style in `gravel-style.json`. Copies style to Bikerouter sources.

Deployment via standard Bikerouter deployment process.
