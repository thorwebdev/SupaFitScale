# SupaFitScale

Read Xiaomi Mi Scale (MIBFS) with the [Web Bluetooth Scanning API](https://googlechrome.github.io/samples/web-bluetooth/scan.html) and store results in Supabase, secured by Supabase Auth and RLS.

![Demo image](https://i.imgur.com/xnbdyzO.jpg)

### Setup

- Install [Docker](https://docs.docker.com/get-docker/)
- Install the [Supabase CLI](https://supabase.com/docs/guides/cli)

```bash
# start supabase locally and apply the setup migrations
supabase start
```

### Build and Serve

```bash
# install dependencies
npm install

# serve with hot reload at localhost:1234
npm run dev

# build for production
npm run build
```

### Special Thanks

All the hard work around reading the Bluetooth data has been done by [Henry Lim](https://twitter.com/henrylim96) in https://github.com/limhenry/web-bluetooth-mi-scale. Also read [this article](https://dev.to/henrylim96/reading-xiaomi-mi-scale-data-with-web-bluetooth-scanning-api-1mb9) for detailed explanation on how things work.

@wiecosystem: [https://github.com/wiecosystem/Bluetooth](https://github.com/wiecosystem/Bluetooth)
