import React from 'react'
import ReactDOM from 'react-dom'

class KnockKnockApp extends React.Component {
  render() {
    return <p>Knock Knock App</p>
  }
}

document.addEventListener('turbolinks:load', () => {
  const app = document.getElementById('knock-knock-app')
  app && ReactDOM.render(<KnockKnockApp />, app)
})