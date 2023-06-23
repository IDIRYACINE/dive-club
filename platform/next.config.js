const path = require('path');

/** @type {import('next').NextConfig} */
const nextConfig = {
    webpack: (config) => {
        config.resolve.alias['@'] = path.resolve(__dirname, './src'); 

        return config;
      },
      generateEtags: false,
      reactStrictMode: true,

}

module.exports = nextConfig
