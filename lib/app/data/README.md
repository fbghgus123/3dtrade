# Providers
Add all data providers here. 
* The provider must be initialized before being used in a controller. Add it to the binding file.

## BaseProvider
I have added basic functionality like adding token to request, getting refresh token etc., to the base provider.

## Adding A new provider
When you add a new provider. Extend BaseProvider DO NOT extend GetConnect directly.