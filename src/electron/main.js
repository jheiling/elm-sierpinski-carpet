'use strict'
const electron = require('electron')

const app = electron.app
const BrowserWindow = electron.BrowserWindow

let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow({ width: 1024, height: 768 })
  mainWindow.loadURL(`file://${ __dirname }/../../sierpinski-carpet.html`)
  mainWindow.on('closed', function () { mainWindow = null })
}

app.on('ready', createWindow)
app.on('window-all-closed', () => { if (process.platform !== 'darwin') { app.quit() } })
app.on('activate', () => { if (mainWindow === null) { createWindow() } })
