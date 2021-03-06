class QuizPage
  timeLimit: 15 # seconds

  constructor: (@page) ->
    @timer = @page.find('.timer')
    @answerButton = @page.find('.answer-field')
    @answer = @page.find('.answer')
    @points = @page.find('.points')
    @setBehaviors()

  setBehaviors: ->
    @answerButton.find('.btn').on 'click', (e) =>
      e.preventDefault()
      @answerButton.addClass('hide')
      @answer.removeClass('hide')
      @revealPoints()

  startTimer: ->
    @timer.countdown(
      until: @timeLimit, format: 'S'
      onExpiry: =>
        @timer.countdown('destroy')
        @timesUp()
    )

  revealPoints: ->
    @points.removeClass('hide')

  timesUp: ->
    @timer.slideUp()
    @answerButton.removeClass('hide')

$ ->
  $quiz = $('.quiz-page')
  if $quiz.length > 0
    quizPage = new QuizPage($quiz)
    quizPage.startTimer()

