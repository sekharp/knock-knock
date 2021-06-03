import React from 'react'
import ReactDOM from 'react-dom'
import axios from "axios";
import Prospects from "./Prospects";
import Prospect from "./Prospect"

class KnockKnockApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      prospects: []
    };
    this.getProspects = this.getProspects.bind(this);
  }

  componentDidMount() {
    this.getProspects();
  }

  getProspects() {
    axios
      .get("/api/v1/prospects")
      .then(response => {
        const prospects = response.data;
        this.setState({ prospects });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render() {
    return (
      <div>
        <a href='/create'>Add Prospects</a>
        <Prospects>
          {this.state.prospects.map(prospect => (
            <Prospect key={prospect.id} prospect={prospect} />
          ))}
        </Prospects>
      </div>
    )
  }
}

document.addEventListener('turbolinks:load', () => {
  const app = document.getElementById('knockknock-app')
  app && ReactDOM.render(<KnockKnockApp />, app)
})