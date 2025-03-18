const { webpackConfig, merge } = require('shakapacker')

const customConfig = {
    resolve: {
        // Add additional file types
        extensions: ['.js', '.jsx', '.scss', '.css'],
    },
};

module.exports = merge(webpackConfig, customConfig)
