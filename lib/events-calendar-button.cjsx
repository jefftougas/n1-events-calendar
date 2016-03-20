{Utils, DraftStore, React} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'

class EventsCalendarButton extends React.Component

  # Note: You should assign a new displayName to avoid naming
  # conflicts when injecting your item
  @displayName: 'EventsCalendarButton'

  # When you register as a composer button, you receive a
  # reference to the draft, and you can look it up to perform
  # actions and retrieve data.
  @propTypes:
    draftClientId: React.PropTypes.string.isRequired

  render: =>
    <button className="btn btn-toolbar item-events-calendar" onClick={ => @_onClick()} ref="button">
      Calendar
    </button>

  _onClick: =>
    BrowserWindow = require('electron').remote.BrowserWindow
    w = new BrowserWindow
      title: 'N1 Events Calendar'
      width: 720
      height: 480

    # Display calendar.html in the window
    path = require 'path'
    url = path.join __dirname, '..', 'calendar.html'
    w.loadUrl "file://#{url}"

module.exports = EventsCalendarButton
