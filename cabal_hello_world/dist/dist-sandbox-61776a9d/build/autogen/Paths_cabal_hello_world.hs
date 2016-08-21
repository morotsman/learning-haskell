{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_cabal_hello_world (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/niklasleopold/development/my_projects/learning-haskell/cabal_hello_world/.cabal-sandbox/bin"
libdir     = "/Users/niklasleopold/development/my_projects/learning-haskell/cabal_hello_world/.cabal-sandbox/lib/x86_64-osx-ghc-8.0.1/cabal-hello-world-0.1.0.0-F4ToYDSkFCgB0AW1g4DP8O"
datadir    = "/Users/niklasleopold/development/my_projects/learning-haskell/cabal_hello_world/.cabal-sandbox/share/x86_64-osx-ghc-8.0.1/cabal-hello-world-0.1.0.0"
libexecdir = "/Users/niklasleopold/development/my_projects/learning-haskell/cabal_hello_world/.cabal-sandbox/libexec"
sysconfdir = "/Users/niklasleopold/development/my_projects/learning-haskell/cabal_hello_world/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cabal_hello_world_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cabal_hello_world_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "cabal_hello_world_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cabal_hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cabal_hello_world_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
