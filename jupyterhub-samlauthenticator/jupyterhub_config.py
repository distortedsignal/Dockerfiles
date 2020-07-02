## Configuration file for jupyterhub.
# Most comments shamelessly stolen from the default jupyterhub config file
# generated when a user runs `jupyterhub --generate-config`. There are some
# defaults that have been changed 

## Class for authenticating users.
#  
#          This should be a subclass of :class:`jupyterhub.auth.Authenticator`
#  
#          with an :meth:`authenticate` method that:
#  
#          - is a coroutine (asyncio or tornado)
#          - returns username on success, None on failure
#          - takes two arguments: (handler, data),
#            where `handler` is the calling web.RequestHandler,
#            and `data` is the POST form data from the login page.
#  
#          .. versionchanged:: 1.0
#              authenticators may be registered via entry points,
#              e.g. `c.JupyterHub.authenticator_class = 'pam'`
#  
#  Currently installed: 
#    - default: jupyterhub.auth.PAMAuthenticator
#    - dummy: jupyterhub.auth.DummyAuthenticator
#    - pam: jupyterhub.auth.PAMAuthenticator
#    - saml: samlauthenticator.SAMLAuthenticator

# It is assumed since this is the downloaded image (instead of the
# official jupyterhub image) that the SAMLAuthenticator is the
# desired authenticator.
c.JupyterHub.authenticator_class = 'samlauthenticator.SAMLAuthenticator'

# The location of the metadata file.
# c.SAMLAuthenticator.metadata_filepath = '/srv/jupyterhub/config/metadata.xml'

# The inlined metadata.
# c.SAMLAuthenticator.metadata_filepath = ''' '''

# The URL of the metadata.
# c.SAMLAuthenticator.metadata_url = ''

# Include any other configurations here.
