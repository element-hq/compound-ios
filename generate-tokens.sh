# Remove the old tokens.
rm -rf Sources/CompoundTokens

# Get the latest tokens.
yarn upgrade

# Build the tokens.
cd node_modules/@vector-im/compound
yarn install
yarn build

# Copy the tokens.
mv ios/dist ../../../Sources/CompoundTokens
