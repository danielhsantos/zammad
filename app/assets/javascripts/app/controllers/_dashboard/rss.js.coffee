$ = jQuery.sub()

class App.DashboardRss extends App.Controller
  constructor: ->
    super


    # bind to new events
    @reBind( 'rss_rebuild', @load )

    # refresh list ever 600 sec.
    @fetch()

  fetch: =>
    cache = App.Store.get( 'dashboard_rss' )
    if cache
      @load( cache )

  load: (data) =>
    items = data.items || []
    @head = data.head || '?'
    @render(items)

  render: (items) ->
    html = App.view('dashboard/rss')(
      head:  @head,
      items: items
    )
    html = $(html)
    @html html
